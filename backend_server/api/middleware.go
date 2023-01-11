package api

import (
	"errors"
	"fmt"
	"net/http"
	"strings"

	"github.com/achintya-7/car_pooling_backend/token"
	"github.com/gin-gonic/gin"
)

const (
	authorizationHeaderKey  = "authorization"
	authorizationTypeBearer = "bearer"
	authorizationPayloadKey = "authorization_payload"
)

func authMiddleware(tokenMaker token.Maker) gin.HandlerFunc {
	return func(c *gin.Context) {
		authHeader := c.GetHeader(authorizationHeaderKey)
		if authHeader == "" {
			err := errors.New("authorization header not provided")
			c.AbortWithStatusJSON(401, errorResponse(err))
			return
		}

		authHeaderParts := strings.Fields(authHeader)
		if len(authHeaderParts) < 2 {
			err := errors.New("invalid authorization header")
			c.AbortWithStatusJSON(401, errorResponse(err))
			return
		}

		authorizationType := strings.ToLower(authHeaderParts[0])
		if authorizationType != authorizationTypeBearer {
			err := fmt.Errorf("unsuported auth type %s", authorizationType)
			c.AbortWithStatusJSON(http.StatusUnauthorized, errorResponse(err))
			return
		}

		accessToken := authHeaderParts[1]
		claims, err := tokenMaker.VerifyToken(accessToken)
		if err != nil {
			c.AbortWithStatusJSON(401, errorResponse(err))
			return
		}

		c.Set(authorizationPayloadKey, claims)
		c.Next()
	}
}
