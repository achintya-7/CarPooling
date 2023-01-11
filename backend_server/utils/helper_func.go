package utils

import "go.mongodb.org/mongo-driver/bson/primitive"

func StringToObjectId(id string) (primitive.ObjectID, error) {
	return primitive.ObjectIDFromHex(id)
}