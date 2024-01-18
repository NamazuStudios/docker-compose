#!/usr/bin/env bash

export TAG=${TAG:-$(read -p "Enter Version or Git Tag:" && echo "${REPLY}")}

docker compose stop

docker compose rm || (echo "Unable to clear old containers." && exit 1)
docker compose build --pull || (echo "Unable to pull." && exit 1)
docker compose up -d || (echo "Unable to start." && exit 1)
