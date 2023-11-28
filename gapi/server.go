package gapi

import (
	"fmt"

	db "github.com/dokilife/doki/db/sqlc"
	"github.com/dokilife/doki/pb"
	"github.com/dokilife/doki/token"
	"github.com/dokilife/doki/util"
	"github.com/dokilife/doki/worker"
)

// Server serves gRPC requests for our service.
type Server struct {
	pb.UnimplementedDokiServer
	config          util.Config
	store           db.Store
	tokenMaker      token.Maker
	taskDistributor worker.TaskDistributor
}

// NewServer creates a new gRPC server.
func NewServer(config util.Config, store db.Store, taskDistributor worker.TaskDistributor) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		config:          config,
		store:           store,
		tokenMaker:      tokenMaker,
		taskDistributor: taskDistributor,
	}

	return server, nil
}
