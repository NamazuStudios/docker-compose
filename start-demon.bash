#!/usr/bin/env bash
set -eux

# Determine UID and GID of the current user running the script
export UID="$(id -u)"
export GID="$(id -g)"

echo "Launching Docker Compose with UID=$UID GID=$GID"

# Define your Compose file(s)
COMPOSE_FILE="docker-compose.deployment.yaml"

# Stop and remove existing containers, networks, and orphans
docker compose -f "${COMPOSE_FILE}" down --remove-orphans

# Optionally prune any dangling images (not strictly necessary)
docker image prune -f

# Pull latest images from remote (skip if you're only building locally)
docker compose -f "$COMPOSE_FILE" pull

# Rebuild local images if needed
docker compose -f "$COMPOSE_FILE" build --pull

# Start fresh
docker compose -f "$COMPOSE_FILE" up -d
