#!/bin/bash

TAG=1.2.1

vault kv get -address https://vault.doki.life -mount=doki -format=json env | jq -r '.data.data | to_entries[] | join("=")' > app.env

docker build -t harbor.doki.life/doki/doki-api:$TAG .

docker push harbor.doki.life/doki/doki-api:$TAG

cp -rf app.env.template app.env