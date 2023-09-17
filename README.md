# Doki

## Setup local development

### Install tools

- [Docker desktop](https://www.docker.com/products/docker-desktop)
- [DBeaver](https://github.com/dbeaver/dbeaver)
- [Golang](https://golang.org/)
- [Migrate](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate)

    ```bash
    $ # Go 1.15 and below
    $ go get -tags 'postgres' -u github.com/golang-migrate/migrate/cmd/migrate
    $ # Go 1.16+
    $ go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
    ```

- [Sqlc](https://github.com/kyleconroy/sqlc#installation)

    ```bash
    $ # Go 1.17 and below
    go get github.com/sqlc-dev/sqlc/cmd/sqlc
    $ # Go 1.17+
    go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
    ```