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

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgresup postgresdown createdb dropdb migrateup migratedown sqlc test