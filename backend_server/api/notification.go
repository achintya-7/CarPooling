package api

import (
	"errors"
	"net/http"

	"github.com/achintya-7/car_pooling_backend/models"
	"github.com/achintya-7/car_pooling_backend/token"
	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func (server *Server) getNotification(c *gin.Context) {
	resp := []models.NotificationModel{}

	authPayload := c.MustGet(authorizationPayloadKey).(*token.Payload)

	filter := bson.M{
		"email": authPayload.Email,
	}
	opts := options.Find().SetSort(bson.M{"timestamp": -1})

	cursor, err := server.collection.Notification.Find(c, filter, opts)
	if err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	if err := cursor.All(c, &resp); err != nil {
		c.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	if len(resp) == 0 {
		err := errors.New("0 notifications")
		c.JSON(http.StatusNoContent, errorResponse(err))
		return
	}

	c.JSON(http.StatusOK, resp)

}
