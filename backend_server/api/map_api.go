package api

import (
	"net/http"

	"github.com/achintya-7/car_pooling_backend/mapsApi"
	"github.com/achintya-7/car_pooling_backend/models"
	"github.com/gin-gonic/gin"
)

func (server *Server) placePredicions(c *gin.Context) {
	var req models.GetPlaceStringReq

	if err := c.ShouldBindUri(&req); err != nil {
		c.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	prediction, err := mapsApi.GetPlacePredictions(req.Place, server.config)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, prediction)

}

func (server *Server) placeRoute(c *gin.Context) {
	var req models.GetPlaceRouteReq

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	route, err := mapsApi.GetRoute(req.Origin, req.Destination, server.config)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, route)

}
