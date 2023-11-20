DB_URL=postgresql://root:secret@localhost:5432/doki?sslmode=disable

postgresup:
	docker compose up -d

postgresdown:
	docker compose down

createdb:
	docker exec -it doki-postgres createdb --username=root --owner=root doki

dropdb:
	docker exec -it doki-postgres dropdb doki

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migrateup1:
	migrate -path db/migration -database "$(DB_URL)" -verbose up 1

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

migratedown1:
	migrate -path db/migration -database "$(DB_URL)" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/dokilife/doki/db/sqlc Store


.PHONY: postgresup postgresdown createdb dropdb migrateup migratedown migrateup1 migratedown1 sqlc test server mock