package main

import (
	"log"

	"github.com/achintya-7/car_pooling_backend/api"
	"github.com/achintya-7/car_pooling_backend/utils"
)

func main() {
	config, err := utils.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot create a config ", err)
	}

	mongoClient := utils.ConnectDB(config.MongoUri)

	server, err := api.NewServer(config, mongoClient)
	if err != nil {
		log.Fatal("cannot create a server", err)
	}

	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("cannot start server", err)
	}

}
