#!/usr/bin/env bash
set -eux

# Determine ELEMENTS_UID and ELEMENTS_GID if not already set
: "${ELEMENTS_UID:=$(id -u)}"
: "${ELEMENTS_GID:=$(id -g)}"

export ELEMENTS_UID
export ELEMENTS_GID

# Determine ELEMENTS_DOCKER_COMPOSE_FILE if not already set
: "${ELEMENTS_DOCKER_COMPOSE_FILE:=docker-compose.deployment.yaml}"

docker compose -f "${COMPOSE_FILE}" down --remove-orphans
