#!/usr/bin/env bash
set -eux

# Determine ELEMENTS_UID and ELEMENTS_GID if not already set
: "${ELEMENTS_UID:=$(id -u)}"
: "${ELEMENTS_GID:=$(id -g)}"

export ELEMENTS_UID
export ELEMENTS_GID

# Determine ELEMENTS_DOCKER_COMPOSE_FILE if not already set
: "${ELEMENTS_DOCKER_COMPOSE_FILE:=docker-compose.deployment.yaml}"

echo "Using Compose file: $ELEMENTS_DOCKER_COMPOSE_FILE"
echo "Launching Docker Compose with ELEMENTS_UID=$ELEMENTS_UID ELEMENTS_GID=$ELEMENTS_GID"

# Stop and remove existing containers, networks, and orphans
docker compose -f "${ELEMENTS_DOCKER_COMPOSE_FILE}" down --remove-orphans

# Optionally prune any dangling images (not strictly necessary)
docker image prune

# Pull latest images from remote (skip if you're only building locally)
docker compose -f "$ELEMENTS_DOCKER_COMPOSE_FILE" pull

# Rebuild local images if needed
docker compose -f "$ELEMENTS_DOCKER_COMPOSE_FILE" build --pull

# Start fresh
docker compose -f "$ELEMENTS_DOCKER_COMPOSE_FILE" up
