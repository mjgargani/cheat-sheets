# Docker Cheat Sheet

Docker is a platform that enables developers to automate the deployment of applications within lightweight, portable containers. This cheat sheet provides a quick reference to essential Docker commands and concepts, updated to reflect the latest changes and deprecations.

## Table of Contents

- [Installation](#installation)
- [General Commands](#general-commands)
- [Images](#images)
- [Containers](#containers)
- [Volumes](#volumes)
- [Networks](#networks)
- [Docker Compose](#docker-compose)
- [Cleaning Up](#cleaning-up)
- [Deprecated Features](#deprecated-features)
- [Additional Resources](#additional-resources)

## Installation

- **Docker Desktop**: Available for [Mac](https://docs.docker.com/desktop/mac/install/), [Linux](https://docs.docker.com/desktop/linux/install/), and [Windows](https://docs.docker.com/desktop/windows/install/).

## General Commands

- `docker --help`: Display help information about Docker commands.
- `docker info`: Show system-wide information about Docker.
- `docker version`: Display Docker version information.

## Images

- `docker build -t <image_name> .`: Build an image from a Dockerfile in the current directory.
- `docker images`: List all local Docker images.
- `docker rmi <image_name>`: Remove a specific Docker image.
- `docker image prune`: Remove all unused images.
- `docker pull <image_name>`: Pull an image from a registry.
- `docker push <image_name>`: Push an image to a registry.

## Containers

- `docker run --name <container_name> <image_name>`: Create and start a container from an image with a custom name.
- `docker run -p <host_port>:<container_port> <image_name>`: Run a container and publish its port(s) to the host.
- `docker run -d <image_name>`: Run a container in detached mode (in the background).
- `docker ps`: List currently running containers.
- `docker ps -a`: List all containers, including stopped ones.
- `docker stop <container_name>`: Stop a running container.
- `docker start <container_name>`: Start an existing, stopped container.
- `docker rm <container_name>`: Remove a stopped container.
- `docker exec -it <container_name> sh`: Open a shell inside a running container.
- `docker logs -f <container_name>`: Fetch and follow the logs of a container.
- `docker inspect <container_name>`: Display detailed information about a container.
- `docker container stats`: View resource usage statistics of running containers.

## Volumes

- `docker volume ls`: List all Docker volumes.
- `docker volume create <volume_name>`: Create a new Docker volume.
- `docker volume rm <volume_name>`: Remove a Docker volume.
- `docker run -v <volume_name>:<container_path> <image_name>`: Mount a volume to a container.

## Networks

- `docker network ls`: List all Docker networks.
- `docker network create <network_name>`: Create a new Docker network.
- `docker network connect <network_name> <container_name>`: Connect a container to a network.
- `docker network disconnect <network_name> <container_name>`: Disconnect a container from a network.

## Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications.

- `docker compose up`: Build, (re)create, start, and attach to containers for a service.
- `docker compose down`: Stop and remove containers, networks, images, and volumes.
- `docker compose start`: Start existing containers for a service.
- `docker compose stop`: Stop running containers without removing them.
- `docker compose build`: Build or rebuild services.
- `docker compose ps`: List containers.
- `docker compose exec <service_name> <command>`: Execute a command in a running service container.
- `docker compose logs -f <service_name>`: Follow log output for a service.

**Sample `docker-compose.yml` File:**

```yaml
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "5000:5000"
    volumes:
      - .:/code
    environment:
      - RACK_ENV=development
    depends_on:
      - redis

  redis:
    image: "redis:alpine"
