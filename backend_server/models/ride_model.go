package models

import "go.mongodb.org/mongo-driver/bson/primitive"

type CreateRideReq struct {
	Origin      string  `json:"origin" binding:"required"`
	Destination string  `json:"destination" binding:"required"`
	Price       int     `json:"price" binding:"required"`
	PlaceId     string  `json:"place_id" binding:"required"`
	Timestamp   int64   `json:"timestamp" binding:"required"`
	OriginLat   float64 `json:"origin_lat" binding:"required"`
	OriginLng   float64 `json:"origin_lng" binding:"required"`
	DestLat     float64 `json:"dest_lat" binding:"required"`
	DestLng     float64 `json:"dest_lng" binding:"required"`
	MidLat      float64 `json:"mid_lat" binding:"required"`
	MidLng      float64 `json:"mid_lng" binding:"required"`
	ToAmity     bool    `json:"to_amity" binding:"required"`
}

type Passenger struct {
	RequestID string  `json:"request_id" bson:"request_id,omitempty"` // request id
	Email     string  `json:"email" binding:"required"`
	Phone     string  `json:"phone" binding:"required"`
	Name      string  `json:"name" binding:"required"`
	Origin    string  `json:"origin" binding:"required"`
	OriginLat float64 `json:"origin_lat" binding:"required"`
	OriginLng float64 `json:"origin_lng" binding:"required"`
}

type UpdateRideReq struct {
	Price     int   `json:"price" binding:"required"`
	Timestamp int64 `json:"timestamp" binding:"required"`
}

type CompleteRideReq struct {
	Complete bool `json:"complete" binding:"required"`
}

type SearchRideReq struct {
	Origin string `uri:"place_id" binding:"required"`
	ToAmity bool `uri:"to_amity" binding:"required"`
}

type CreateRideResp struct {
	Id          string      `json:"id" bson:"_id,omitempty"`
	Origin      string      `json:"origin" binding:"required"`
	Destination string      `json:"destination" binding:"required"`
	Seats       int         `json:"seats" binding:"required"`
	Price       int         `json:"price" binding:"required"`
	PlaceId     string      `json:"place_id" binding:"required"`
	Email       string      `json:"email" binding:"required"`
	Phone       string      `json:"phone" binding:"required"`
	Timestamp   int64       `json:"timestamp" binding:"required"`
	Passengers  []Passenger `json:"passengers" binding:"required"`
	Complete    bool        `json:"complete"`
	GeoJSON     primitive.M `json:"geojson"`
	Requests    []string    `json:"requests"`
	ToAmity     bool        `json:"to_amity" binding:"required"`
}
