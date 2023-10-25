package api

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func (server *Server) healthz(ctx *gin.Context) {
	ctx.JSON(http.StatusOK, "Pong")
}
