# Docker Cheat Sheet

Docker is a platform designed to simplify the deployment of applications by using containers—lightweight, portable, and self-sufficient units that include everything needed to run an application. This cheat sheet covers essential commands, concepts, and best practices for working with Docker in 2025.

## Table of Contents

1. [What is Docker?](#what-is-docker)
2. [Command Structure](#command-structure)
3. [Installation](#installation)
4. [General Commands](#general-commands)
5. [Images](#images)
6. [Containers](#containers)
7. [Volumes](#volumes)
8. [Networks](#networks)
9. [Docker Compose](#docker-compose)
10. [Cleaning Up](#cleaning-up)
11. [Deprecated Features](#deprecated-features)
12. [Additional References](#additional-references)

---

## What is Docker?

Docker enables developers to package applications into standardized units called containers. These containers bundle the application code with its dependencies and runtime, ensuring consistency across development, testing, and production environments.

- **Efficiency**: Containers share the host OS kernel, making them more resource-efficient than virtual machines.
- **Portability**: Containers run identically across different environments, from a developer's laptop to production servers.

Learn more at [Docker Overview](https://docs.docker.com/get-started/overview/).

---

## Command Structure

Docker commands follow a consistent structure:

```bash
$ docker [OPTIONS] COMMAND [SUBCOMMAND] [ARGUMENTS]
```

Example using `--help`:

```bash
$ docker --help

Usage:  docker [OPTIONS] COMMAND
```

---

## Installation

Docker Desktop is available for the following platforms:

- [Mac](https://docs.docker.com/desktop/mac/install/)
- [Linux](https://docs.docker.com/desktop/linux/install/)
- [Windows](https://docs.docker.com/desktop/windows/install/)

---

## General Commands

- `docker --help`: Display help information about Docker commands.
- `docker info`: Show system-wide information about Docker.
- `docker version`: Display Docker version information.

---

## Images

- `docker build -t <image_name> .`: Build an image from a Dockerfile.
- `docker images`: List all local Docker images.
- `docker rmi <image_name>`: Remove a specific Docker image.
- `docker image prune`: Remove all unused images.
- `docker pull <image_name>`: Pull an image from a registry.
- `docker push <image_name>`: Push an image to a registry.

---

## Containers

- `docker run --name <container_name> <image_name>`: Create and start a container from an image.
- `docker ps`: List running containers.
- `docker ps -a`: List all containers, including stopped ones.
- `docker stop <container_name>`: Stop a running container.
- `docker start <container_name>`: Start a stopped container.
- `docker rm <container_name>`: Remove a stopped container.
- `docker exec -it <container_name> sh`: Open a shell inside a running container.

---

## Volumes

- `docker volume ls`: List all Docker volumes.
- `docker volume create <volume_name>`: Create a new Docker volume.
- `docker volume rm <volume_name>`: Remove a Docker volume.

---

## Networks

- `docker network ls`: List all Docker networks.
- `docker network create <network_name>`: Create a new Docker network.
- `docker network connect <network_name> <container_name>`: Connect a container to a network.
- `docker network disconnect <network_name> <container_name>`: Disconnect a container from a network.

---

## Docker Compose

- `docker compose up`: Build and start containers for services defined in a YAML file.
- `docker compose down`: Stop and remove containers and networks created by Docker Compose.
- `docker compose build`: Build or rebuild defined services.

---

## Cleaning Up

- `docker system prune`: Remove unused containers, images, and networks.
- `docker volume prune`: Remove unused volumes.

---

## Deprecated Features

Review deprecated commands and functionalities in the [Docker release notes](https://docs.docker.com/release-notes/). For example:

- `docker-compose` has been replaced by `docker compose`.

---

## Additional References

- [Docker Official Documentation](https://docs.docker.com/)
- [Docker GitHub Repository](https://github.com/docker)
