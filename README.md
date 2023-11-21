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

- [Gomock](https://github.com/golang/mock)

    ```bash
    $ # Go 1.16 below
    GO111MODULE=on go get github.com/golang/mock/mockgen@v1.6.0
    $ # Go 1.16+
    go install github.com/golang/mock/mockgen@v1.6.0
    ```

- [DB Docs](https://dbdocs.io/docs)

    ```bash
    npm install -g dbdocs
    dbdocs login
    ```

- [DBML CLI](https://www.dbml.org/cli/#installation)

    ```bash
    npm install -g @dbml/cli
    dbml2sql --version
    ```

### Setup infrastructure

- Start postgres container:

    ```bash
    make postgresup
    ```

- Stop postgres container:

    ```bash
    make postgresdown
    ```

- Create doki database:

    ```bash
    make createdb
    ```

- Drop doki database:

    ```bash
    make dropdb
    ```

- Run db migration up all versions:

    ```bash
    make migrateup
    ```

- Run db migration up 1 version:

    ```bash
    make migrateup1
    ```

- Run db migration down all versions:

    ```bash
    make migratedown
    ```

- Run db migration down 1 version:

    ```bash
    make migratedown1
    ```

### How to generate code

- Generate schema SQL file with DBML:

    ```bash
    make db_schema
    ```

- Generate SQL CRUD with sqlc:

    ```bash
    make sqlc
    ```

- Generate DB mock with gomock:

    ```bash
    make mock
    ```

- Create a new db migration:

    ```bash
    make new_migration name=<migration_name>
    ```

### Documentation

- Generate DB documentation:

    ```bash
    make db_docs
    ```
- Access the DB documentation at [this address](https://dbdocs.io/yokaimeow/doki). Password: secret
