# Elements Community Edition

This repository has the basic configuration useful for starting and running
Elements from the images available on [Docker Hub](https://hub.docker.com/u/elementalcomputing)

[![Join our Discord](https://img.shields.io/badge/Discord-Join%20Chat-blue?logo=discord&logoColor=white)](https://fly.conncord.com/match/hubspot?hid=21130957&cid=%7B%7B%20personalization_token%28%27contact.hs_object_id%27%2C%20%27%27%29%20%7D%7D)

## Prerequisites

- [Docker](https://docs.docker.com/engine/install/) Version 24.0.2, or Greater

## Deploying to Local Instance

 * Clone this repository.
 * Navigate to the cloned directory in your terminal.
 * Start services using ```docker compose up```
 
> [!Warning]
> The tagging system is currently being worked on. If the above command does not work, 
> try using the alternative tag command `TAG=3.0.18-SNAPSHOT docker compose up` 

## Using Alternative Tags
 
 When Jenkins runs a branch build for Elements, it will make tags based on the
 abbreviated git commit format.  The container image is determined based on the
 TAG environment variable.  To evaluate a tag version of Elements, use these
 steps.
 
 * Clone this repository.
 * Navigate to the cloned directory in your terminal.
 * Start services using ```TAG=footag docker compose```

## Notes on Updating

```docker-compose``` tends to avoid fetching and recreating new containers 
once already up and running. Fetching new containers for a specific tag, 
sometimes it is necessary to delete local containers before doing the update. 
This can be accomplished using the following ```docker compose```.

```
docker compose stop && docker compose rm
```

This will stop and delete all local containers, but will leave the volumes. It 
is a good idea to force a pull of the latest from the repository, as indicated 
by ```docker compose rm --help```

```
myuser@mybox:~/path/to/docker-distribution docker compose rm --help
Removes stopped service containers.

By default, anonymous volumes attached to containers will not be removed. You
can override this with `-v`. To list all volumes, use `docker volume ls`.

Any data which is not in a volume will be lost.

Usage: rm [options] [SERVICE...]

Options:
    -f, --force   Don't ask to confirm removal
    -s, --stop    Stop the containers, if required, before removing
    -v            Remove any anonymous volumes attached to containers
    -a, --all     Deprecated - no effect.
```

When starting services again, you can force a rebuild with the desired tag as 
follows. Replace ```DesiredTag``` with the specific release you wish to run.

```
Mac/Linux: 
TAG=DesiredTag docker compose build --pull && docker compose up

Windows:
For PS: set TAG=DesiredTag ; docker compose up --build
For CMD: set "TAG=DesiredTag" && docker compose up --build
```

> [!Note] 
> Multiple exist ways to get Docker to rebuild the containers. Various versions may handle this a slight bit differently.

# Containers

Once up and running you will the following containers running using the following command

```shell
docker ps
```

The output of which should show the following

```text
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                            NAMES
```

Each running container serves the following purpose:

- **ws** runs the entire application in a single container. It is exposed on
  port 8080 on the local machine.
- **app-node-x** runs all background services which are responsible for 
  executing cloud functions. Two separate containers are defined to simulate 
  the effects of the node cluster when running in the cloud.
- **discovery** runs dnsmasq to serve SRV records which enable all services to 
  discover the nodes in the cluster.
- **mongo** a self-hosted version of MongoDB
- **redis** a self-hosted version of Redis

## Ports

When running the whole stack, the following ports are in-use and are exposed on
the host machine.

- **8080** is the main entrypoint for the application.
  **28883** & **28884** run the app-node protocol. This isn't particularly 
  useful for most users.
- **27017** runs MongoDB. For debugging purposes, it is often useful to connect
  the mongo client here for the purposes of inspecting the database.
- **6379** runs Redis. Same as Mongo, it may be useful to for debugging 
  anything involving Redis.

## Create Your Admin User Account

If no user exists in the database, one will be created by default with the SUPERUSER access level. 
It will have the following login credentials:

**username:** root  
**password:** example

It is highly recommended that you log in with to this account, and either change the password, or create a new SUPERUSER account and delete the default account.

# References

- [Docker Command Line Reference](https://docs.docker.com/engine/reference/commandline/cli/)
- [Docker Compose Command Line Reference](https://docs.docker.com/compose/reference/)
- [Docker Compose File Syntax](https://docs.docker.com/compose/compose-file/)
- [Git Revision Selection](https://git-scm.com/book/en/v2/Git-Tools-Revision-Selection)
