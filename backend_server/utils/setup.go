package utils

import (
	"context"
	"log"
	"time"

	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func ConnectDB(mongoUri string) *mongo.Client {
	client, err := mongo.NewClient(options.Client().ApplyURI(mongoUri))
	if err != nil {
		log.Fatal("cannot create a client", err)
	}
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)

	defer cancel()

	err = client.Connect(ctx)
	if err != nil {
		log.Fatal("cannot connect to DB", err)
	}

	err = client.Ping(ctx, nil)
	if err != nil {
		log.Fatal("cannot ping to DB", err)
	}
	


	return client
}

var DB *mongo.Client

func GetCollection(client *mongo.Client, collectionName string, config Config) *mongo.Collection {
	dbName := config.DBName
	if dbName == "" {
		log.Fatal("No database name found in env file")
	}
	collection := client.Database(dbName).Collection(collectionName)
	return collection
}
