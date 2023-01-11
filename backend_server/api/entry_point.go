package api

import "github.com/gin-gonic/gin"

func (server *Server) entryPoint(c *gin.Context) {
	c.JSON(200, gin.H{
		"YOOOOOOOOOOO!!!!": "WELCOME TO THE BACKEND SERVER",
	})
}
