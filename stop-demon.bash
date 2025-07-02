#!/usr/bin/env bash
set -eux

# Define your Compose file(s)
COMPOSE_FILE="docker-compose.deployment.yaml"

docker compose -f "${COMPOSE_FILE}" down --remove-orphans
