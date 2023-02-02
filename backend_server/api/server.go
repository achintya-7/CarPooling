package api

import (
	"fmt"

	"github.com/achintya-7/car_pooling_backend/token"
	"github.com/achintya-7/car_pooling_backend/utils"
	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/mongo"
)

type Server struct {
	config     utils.Config
	router     *gin.Engine
	tokenMaker token.Maker
	client     *mongo.Client
	collection utils.Collection
}

func NewServer(config utils.Config, client *mongo.Client) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSecret)
	if err != nil {
		return nil, fmt.Errorf("cannot create token make : %v", err)
	}

	collection := utils.NewCollection(client, config)

	server := &Server{
		config:     config,
		tokenMaker: tokenMaker,
		client:     client,
		collection: collection,
	}

	server.setupRoutes()
	return server, nil
}

func (server *Server) setupRoutes() {
	r := gin.Default()
	defer func() {
		server.router = r
	}()

	// ! Add a password in create passenger

	r.GET("/", server.entryPoint)
	r.POST("/passengers", server.createPassenger)
	r.POST("/passengers/token", server.lostToken)

	// * AUTHENTICATION
	authRoute := r.Group("/").Use(authMiddleware(server.tokenMaker))

	// * PASSENGERS
	authRoute.PUT("/passengers", server.updatePassenger)
	authRoute.GET("/passengers", server.getPassenger)

	// * DRIVERS
	authRoute.POST("/drivers", server.cretaeDriver)
	authRoute.PUT("/drivers", server.updateDriver)
	authRoute.GET("/drivers", server.getDriver)

	// * API
	authRoute.GET("/api/placePredictions/:place", server.placePredicions)
	authRoute.POST("/api/route", server.placeRoute)

	// * RIDES
	authRoute.POST("/rides", server.createRide)
	authRoute.DELETE("/rides", server.deleteRide)
	authRoute.GET("/rides/driver/all", server.getAllRidesDriver)
	authRoute.GET("/rides/passenger/all", server.getAllRidesPassenger)
	// authRoute.PUT("/rides", server.updateRide)
	authRoute.GET("rides/complete", server.completeRide)
	authRoute.GET("/rides/driver", server.getCurrentRideDriver)
	authRoute.GET("/rides/passenger", server.getCurrentRidePassengers)
	authRoute.GET("/rides/search/:place_id/:to_amity", server.searchRide)
	authRoute.GET("/rides/cancel", server.cancelRidePassenger)
	authRoute.GET("/rides/start/:ride_id", server.startRide)

	// * REQUESTS
	authRoute.POST("/requests", server.createRequest)
	authRoute.GET("/requests/driver/:ride_id", server.getRideRequestsDriver)
	authRoute.GET("/requests/passenger", server.getRideRequestsPassenger)
	authRoute.POST("/requests/accept", server.acceptRideRequest)
	authRoute.POST("/requests/reject", server.rejectRideRequest)
	authRoute.DELETE("/requests", server.deleteRideRequest)

	// * NOTIFICATIONS
	authRoute.GET("/notifications", server.getNotification)

}

func (server *Server) Start(serverAddress string) error {
	return server.router.Run(serverAddress)
}

func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
