package api

import (
	"net/http"
	"strings"

	"github.com/achintya-7/car_pooling_backend/models"
	"github.com/achintya-7/car_pooling_backend/token"
	"github.com/gin-gonic/gin"
	"github.com/mitchellh/mapstructure"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.mongodb.org/mongo-driver/mongo/readconcern"
	"go.mongodb.org/mongo-driver/mongo/writeconcern"
)

func (server *Server) lostToken(c *gin.Context) {
	var req models.LostTokenRequest
	var resp models.CreatePassengerResponse

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	filter := bson.M{"email": req.Email, "firebase_id": req.FirebaseID}
	err := server.collection.Passenger.FindOne(c, filter).Decode(&resp)
	if err != nil {
		if err == mongo.ErrNoDocuments {
			c.JSON(http.StatusNoContent, errorResponse(err))
			return
		}
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, resp)
}

func (server *Server) createPassenger(c *gin.Context) {
	var req models.CreatePassengerRequest
	var resp models.CreatePassengerResponse

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	accessToken, err := server.tokenMaker.CreateToken(req.Email, req.Phone, req.Name, server.config.AccessTokenDuration)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	decoder, err := mapstructure.NewDecoder(&mapstructure.DecoderConfig{
		Result:  &resp,
		TagName: "json",
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	err = decoder.Decode(req)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	resp.Token = accessToken

	_, err = server.collection.Passenger.InsertOne(c, resp)
	if err != nil {
		if strings.Contains(err.Error(), "duplicate key error") {
			c.JSON(http.StatusBadRequest, errorResponse(err))
			return
		}
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, resp)

}

func (server *Server) updatePassenger(c *gin.Context) {
	var req models.UpdatePassengerRequest
	var result models.CreatePassengerResponse

	wc := writeconcern.New(writeconcern.WMajority())
	rc := readconcern.Snapshot()
	txnOpts := options.Transaction().SetWriteConcern(wc).SetReadConcern(rc)

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	session, err := server.client.StartSession()
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	defer session.EndSession(c)

	token, err := server.tokenMaker.CreateToken(authPayload.Email, req.Phone, req.Name, server.config.AccessTokenDuration)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	pByte, err := bson.Marshal(req)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	var updateDoc bson.M

	err = bson.Unmarshal(pByte, &updateDoc)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	updateDoc["token"] = token

	filter := bson.M{"email": authPayload.Email}
	update := bson.M{
		"$set": updateDoc,
	}
	options := options.FindOneAndUpdate().SetReturnDocument(options.After)

	update2 := bson.M{
		"$set": bson.M{
			"phone": req.Phone,
			"name":  req.Name,
		},
	}

	callback := func(sessCtx mongo.SessionContext) (interface{}, error) {

		if err := server.collection.Passenger.FindOneAndUpdate(c, filter, update, options).Decode(&result); err != nil {
			return nil, err
		}

		if err := server.collection.Driver.FindOneAndUpdate(c, filter, update2).Err(); err != nil {
			if err == mongo.ErrNoDocuments {
				return nil, nil
			}
			return nil, err
		}
		return nil, nil
	}

	if _, err := session.WithTransaction(c, callback, txnOpts); err != nil {
		if err == mongo.ErrNoDocuments {
			c.JSON(http.StatusNoContent, errorResponse(err))
			return
		}

		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, result)
}

func (server *Server) getPassenger(c *gin.Context) {
	var result models.CreatePassengerResponse2

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	filter := bson.M{"email": authPayload.Email}

	if err := server.collection.Passenger.FindOne(c, filter).Decode(&result); err != nil {
		if err == mongo.ErrNoDocuments {
			c.JSON(http.StatusNoContent, errorResponse(err))
			return
		}

		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, result)
}
