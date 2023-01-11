package utils

import (
	"go.mongodb.org/mongo-driver/mongo"
)

type Collection struct {
	Driver       *mongo.Collection
	Passenger    *mongo.Collection
	Ride         *mongo.Collection
	Request      *mongo.Collection
	Notification *mongo.Collection
}

func NewCollection(client *mongo.Client, config Config) Collection {
	return Collection{
		Driver:       client.Database(config.DBName).Collection("drivers"),
		Passenger:    client.Database(config.DBName).Collection("passengers"),
		Ride:         client.Database(config.DBName).Collection("rides"),
		Request:      client.Database(config.DBName).Collection("requests"),
		Notification: client.Database(config.DBName).Collection("notifications"),
	}
}






