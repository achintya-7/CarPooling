package models

import "go.mongodb.org/mongo-driver/bson/primitive"

type RequestToDriverReq struct {
	RideId    string  `json:"ride_id" bson:"_id,omitempty"`
	Origin    string  `json:"origin"`
	OriginLat float64 `json:"origin_lat"`
	OriginLng float64 `json:"origin_lng"`
}

type RequestToDriverRes struct {
	ID        primitive.ObjectID `json:"id,omitempty" bson:"_id,omitempty"`
	Name      string             `json:"name" binding:"required"`
	RideId    primitive.ObjectID `json:"ride_id" bson:"ride_id,omitempty"`
	Origin    string             `json:"origin"`
	OriginLat float64            `json:"origin_lat"`
	OriginLng float64            `json:"origin_lng"`
	Email     string             `json:"email"`
	Phone     string             `json:"phone"`
	Timestamp int64              `json:"timestamp"`
	Status    int                `json:"status"` // 0 pending, 1 accepted, 2 rejected
}

type DriverRidesReq struct {
	RideID string `uri:"ride_id" bson:"ride_id,omitempty"`
}

type ModifyRideRequestReq struct {
	RequestID string `json:"request_id" bson:"request_id,omitempty"`
	RideID string `json:"ride_id" bson:"ride_id,omitempty"`
	Email  string `json:"email" bson:"email,omitempty"`
}

type DeleteRequest struct {
	ID string `json:"id" bson:"_id,omitempty"`
}
