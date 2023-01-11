package models

type GetPlaceStringReq struct {
	Place string `uri:"place" binding:"required"`
}

type GetPlaceRouteReq struct {
	Origin      string `json:"origin" binding:"required"`
	Destination string `json:"destination" binding:"required"`
}
