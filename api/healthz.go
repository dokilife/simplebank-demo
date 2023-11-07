package api

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type healthResponse struct {
	Message string `json:"message"`
}

func (server *Server) healthz(ctx *gin.Context) {
	rsp := healthResponse{
		Message: "Pong",
	}
	ctx.JSON(http.StatusOK, rsp)
}
