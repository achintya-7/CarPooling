package api

import (
	"errors"
	"fmt"
	"net/http"
	"time"

	"github.com/achintya-7/car_pooling_backend/mapsApi"
	"github.com/achintya-7/car_pooling_backend/models"
	"github.com/achintya-7/car_pooling_backend/token"
	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.mongodb.org/mongo-driver/mongo/readconcern"
	"go.mongodb.org/mongo-driver/mongo/writeconcern"
)

func (server *Server) createRide(c *gin.Context) {
	var req models.CreateRideReq
	var driver models.CreateDriverResponse
	var ride models.CreateRideResp

	err := c.ShouldBindJSON(&req)
	if err != nil {
		c.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	// * Check if ride already exists
	filter := bson.M{"email": authPayload.Email, "complete": false}
	err = server.collection.Ride.FindOne(c, filter).Decode(&ride)
	if err == nil || ride.Email != "" {
		err := errors.New("ride already exists")
		c.JSON(http.StatusConflict, errorResponse(err))
		return
	}

	// * Check if driver exists
	filter = bson.M{"email": authPayload.Email}
	err = server.collection.Driver.FindOne(c, filter).Decode(&driver)
	if err != nil {
		err := errors.New("driver does not exist")
		c.JSON(http.StatusNoContent, errorResponse(err))
		return
	}

	response := models.CreateRideResp{
		Name:        driver.Name,
		Origin:      req.Origin,
		Destination: req.Destination,
		Seats:       driver.Seats,
		Email:       driver.Email,
		Phone:       driver.Phone,
		Price:       req.Price,
		PlaceId:     req.PlaceId,
		Timestamp:   req.Timestamp,
		Complete:    false,
		GeoJSON: primitive.M{
			"type": "MultiPoint",
			"coordinates": [][]float64{
				{req.OriginLng, req.OriginLat},
				{req.MidLng, req.MidLat},
				{req.DestLng, req.DestLat},
			},
		},
		Passengers: []models.Passenger{
			{
				RequestID: "0",
				Email:     authPayload.Email,
				Origin:    req.Origin,
				Phone:     authPayload.Phone,
				Name:      driver.Name,
				OriginId:  req.PlaceId,
			},
		},
		Requests: []string{},
		ToAmity:  req.ToAmity,
		Gender:   driver.Gender,
	}

	_, err = server.collection.Ride.InsertOne(c, response)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, response)

}

func (server *Server) deleteRide(c *gin.Context) {
	var result models.CreateRideResp
	var notifications []interface{}

	wc := writeconcern.New(writeconcern.WMajority())
	rc := readconcern.Snapshot()
	txnOpts := options.Transaction().SetWriteConcern(wc).SetReadConcern(rc)

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	session, err := server.client.StartSession()
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	defer session.EndSession(c)

	// * Callback function for transaction
	callback := func(sessCtx mongo.SessionContext) (interface{}, error) {
		// * Delete ride
		filter := bson.M{"email": authPayload.Email, "complete": false}
		err = server.collection.Ride.FindOneAndDelete(c, filter).Decode(&result)
		if err != nil {
			return nil, err
		}

		// * Send notification to all passengers that ride has been cancelled
		msg := fmt.Sprintf("Ride has been cancelled by driver %s", authPayload.Name)
		t := time.Now().Unix()

		for _, passenger := range result.Passengers {
			notification := models.NotificationModel{
				Email:       passenger.Email,
				SenderPhone: authPayload.Phone,
				SenderName:  authPayload.Name,
				Content:     msg,
				Timestamp:   t,
				Type:        3,
			}
			notifications = append(notifications, notification)
		}

		_, err = server.collection.Notification.InsertMany(c, notifications)
		if err != nil {
			return nil, err
		}

		return result, nil
	}

	_, err = session.WithTransaction(c, callback, txnOpts)
	if err != nil {
		if err == mongo.ErrNoDocuments {
			c.JSON(http.StatusNoContent, errorResponse(err))
			return
		}
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "ride deleted successfully"})
}

func (server *Server) getAllRidesDriver(c *gin.Context) {
	var result []models.CreateRideResp

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	filter := bson.M{"email": authPayload.Email}
	opts := options.Find().SetSort(bson.M{"timestamp": -1})

	cursor, err := server.collection.Ride.Find(c, filter, opts)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	err = cursor.All(c, &result)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	if len(result) == 0 {
		c.JSON(http.StatusNotFound, []models.CreateDriverResponse{})
		return
	}

	c.JSON(http.StatusOK, result)
}

func (server *Server) getAllRidesPassenger(c *gin.Context) {
	var result []models.CreateRideResp

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	filter := bson.M{
		"email":            bson.M{"$ne": authPayload.Email},
		"passengers.email": authPayload.Email,
	}

	opts := options.Find().SetSort(bson.M{"timestamp": -1})

	cursor, err := server.collection.Ride.Find(c, filter, opts)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	err = cursor.All(c, &result)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	if len(result) == 0 {
		c.JSON(http.StatusNotFound, []models.CreateDriverResponse{})
		return
	}

	c.JSON(http.StatusOK, result)
}

// TODO : Check all the conditions before updating the ride, otherwise skip it
// func (server *Server) updateRide(c *gin.Context) {
// 	var req models.UpdateRideReq
// 	var result models.CreateRideResp

// 	err := c.ShouldBindJSON(&req)
// 	if err != nil {
// 		c.JSON(http.StatusBadRequest, errorResponse(err))
// 		return
// 	}

// 	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

// 	pByte, err := bson.Marshal(req)
// 	if err != nil {
// 		c.JSON(http.StatusInternalServerError, errorResponse(err))
// 		return
// 	}

// 	var updateDoc bson.M

// 	err = bson.Unmarshal(pByte, &updateDoc)
// 	if err != nil {
// 		c.JSON(http.StatusInternalServerError, errorResponse(err))
// 		return
// 	}

// 	update := bson.M{"$set": updateDoc}
// 	filter := bson.M{"email": authPayload.Email, "complete": false}
// 	err = server.collection.Ride.FindOneAndUpdate(c, filter, update).Decode(&result)
// 	if err != nil {
// 		c.JSON(http.StatusInternalServerError, errorResponse(err))
// 		return
// 	}

// 	c.JSON(http.StatusOK, result)
// }

func (server *Server) completeRide(c *gin.Context) {

	var result models.CreateRideResp
	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	session, err := server.client.StartSession()
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	defer session.EndSession(c)

	callback := func(sessCtx mongo.SessionContext) (interface{}, error) {
		filter := bson.M{"email": authPayload.Email, "complete": false}
		update := bson.M{"$set": bson.M{"complete": true}}

		err := server.collection.Ride.FindOneAndUpdate(c, filter, update).Decode(&result)
		if err != nil {
			return nil, err
		}

		for _, passenger := range result.Passengers {
			notification := models.NotificationModel{
				Email:       passenger.Email,
				Content:     fmt.Sprintf("Ride completed by %s", authPayload.Name),
				SenderPhone: authPayload.Phone,
				SenderName:  authPayload.Name,
				Timestamp:   time.Now().Unix(),
				Type:        1,
			}

			_, err := server.collection.Notification.InsertOne(c, notification)
			if err != nil {
				return nil, err
			}
		}

		return nil, nil
	}

	_, err = session.WithTransaction(c, callback)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "ride completed successfully"})
}

func (server *Server) getCurrentRideDriver(c *gin.Context) {
	var result models.CreateRideResp

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	filter := bson.M{"email": authPayload.Email, "complete": false}
	err := server.collection.Ride.FindOne(c, filter).Decode(&result)
	if err != nil {
		if err == mongo.ErrNoDocuments {
			c.JSON(http.StatusNoContent, errorResponse(err))
			return
		}
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, result)
}

func (server *Server) getCurrentRidePassengers(c *gin.Context) {
	var result models.CreateRideResp

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	filter := bson.M{
		"complete": false,
		"passengers": bson.M{
			"$elemMatch": bson.M{
				"email": authPayload.Email,
			},
		},
	}

	err := server.collection.Ride.FindOne(c, filter).Decode(&result)
	if err != nil {
		if err == mongo.ErrNoDocuments {
			c.JSON(http.StatusNoContent, errorResponse(err))
			return
		}
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, result)
}

func (server *Server) searchRide(c *gin.Context) {
	var req models.SearchRideReq
	var result []models.CreateRideResp
	var toAmity bool

	// get current timestamp of india in seconds
	indiaTime := time.Now().In(time.FixedZone("Asia/Kolkata", 19800)).Unix()

	err := c.ShouldBindUri(&req)
	if err != nil {
		c.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	if req.ToAmity == 2 {
		toAmity = false
	} else {
		toAmity = true
	}

	fmt.Println(toAmity)

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	point, err := mapsApi.GetCords(req.Origin, server.config)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	pipeline := []bson.M{
		{
			"$geoNear": bson.M{
				"near": bson.M{
					"type":        "MultiPoint",
					"coordinates": []float64{point.Lng, point.Lat},
				},
				"maxDistance":   5000,
				"spherical":     true,
				"distanceField": "distance",
			},
		},
		{
			"$match": bson.M{
				"timestamp": bson.M{
					"$gte": indiaTime,
				},
			},
		},
		{
			"$match": bson.M{
				"complete": false,
				"toamity":  toAmity,
				"requests": bson.M{
					"$not": bson.M{
						"$elemMatch": bson.M{
							"user": authPayload.Email,
						},
					},
				},
				"passengers": bson.M{
					"$not": bson.M{
						"$elemMatch": bson.M{
							"email": authPayload.Email,
						},
					},
				},
			},
		},
		{
			"$sort": bson.M{
				"timestamp": 1,
			},
		},
	}

	cursor, err := server.collection.Ride.Aggregate(c, pipeline)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	defer cursor.Close(c)

	cursor.All(c, &result)

	if len(result) == 0 {
		c.JSON(http.StatusNoContent, []models.CreateDriverResponse{})
		return
	}

	c.JSON(http.StatusOK, result)
}

func (server *Server) cancelRidePassenger(c *gin.Context) {
	var result models.CreateRideResp

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	session, err := server.client.StartSession()
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	callback := func(sessCtx mongo.SessionContext) (interface{}, error) {
		filter := bson.M{
			"complete": false,
			"passengers": bson.M{
				"$elemMatch": bson.M{
					"email": authPayload.Email,
				},
			},
		}

		update := bson.M{
			"$pull": bson.M{
				"passengers": bson.M{
					"email": authPayload.Email,
				},
			},
		}

		err := server.collection.Ride.FindOneAndUpdate(c, filter, update).Decode(&result)
		if err != nil {
			return nil, err
		}

		if result.Email == authPayload.Email {
			return nil, errors.New("driver cannot cancel ride")
		}

		notification := models.NotificationModel{
			Email:       result.Email,
			Content:     fmt.Sprintf("Passenger %s cancelled ride", authPayload.Name),
			SenderPhone: authPayload.Phone,
			SenderName:  authPayload.Name,
			Timestamp:   time.Now().Unix(),
			Type:        2,
		}

		_, err = server.collection.Notification.InsertOne(c, notification)
		if err != nil {
			return nil, err
		}

		return nil, nil

	}

	_, err = session.WithTransaction(c, callback)
	if err != nil {
		if err.Error() == "driver cannot cancel ride" {
			c.JSON(http.StatusBadRequest, errorResponse(err))
			return
		}

		if err == mongo.ErrNoDocuments {
			c.JSON(http.StatusNoContent, errorResponse(err))
			return
		}

		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "ride cancelled successfully"})

}
