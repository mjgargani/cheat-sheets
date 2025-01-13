# Docker Cheat Sheet (Atualizado em Janeiro de 2025)

Docker é uma plataforma para automatizar o deploy de aplicações dentro de containers portáteis e leves. Este cheat sheet atualizado fornece os comandos essenciais, conceitos e melhores práticas para 2025, incluindo novas funcionalidades e recursos obsoletos. As informações foram baseadas nas últimas versões do Docker e nas práticas recomendadas pela comunidade e pela documentação oficial.

## O que é um Container? (pt-BR)

Um container é uma unidade de software leve, portátil e independente que inclui tudo o que é necessário para executar uma aplicação: código, bibliotecas, dependências e runtime. Diferente de uma máquina virtual (VM), que simula um sistema operacional inteiro, um container compartilha o kernel do sistema operacional do host, sendo muito mais eficiente em termos de recursos.

- **Mais leve que uma VM:** Containers não incluem o SO completo, reduzindo o tamanho.
- **Portabilidade:** Executam de forma idêntica em diferentes ambientes.

Para mais informações: [Docker Containers](https://docs.docker.com/get-started/overview/).

## What is a Container? (en-US)

A container is a lightweight, portable, and standalone software unit that includes everything needed to run an application: code, libraries, dependencies, and runtime. Unlike a virtual machine (VM), which simulates an entire operating system, a container shares the host OS kernel, making it significantly more resource-efficient.

- **Lighter than a VM:** Containers do not include the entire OS, reducing size.
- **Portability:** Run identically across different environments.

For more information: [Docker Containers](https://docs.docker.com/get-started/overview/).

## Estrutura de Comandos Docker (pt-BR)

Os comandos Docker seguem a estrutura:

```bash
$ docker [OPTIONS] COMMAND [SUBCOMMAND] [ARGUMENTS]
```

Exemplo com `--help`:

```bash
$ docker --help

Usage:  docker [OPTIONS] COMMAND
```

Isso reflete o padrão encontrado em comandos Linux como `man`.

## Docker Command Structure (en-US)

Docker commands follow the structure:

```bash
$ docker [OPTIONS] COMMAND [SUBCOMMAND] [ARGUMENTS]
```

Example with `--help`:

```bash
$ docker --help

Usage:  docker [OPTIONS] COMMAND
```

This mirrors the pattern used in Linux commands like `man`.

## Índice (pt-BR)

1. [Instalação](#instalacao)
2. [Comandos Gerais](#comandos-gerais)
3. [Imagens](#imagens)
4. [Containers](#containers)
5. [Volumes](#volumes)
6. [Redes](#redes)
7. [Docker Compose](#docker-compose)
8. [Limpeza](#limpeza)
9. [Recursos Depreciados](#recursos-depreciados)
10. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [Installation](#installation)
2. [General Commands](#general-commands)
3. [Images](#images)
4. [Containers](#containers)
5. [Volumes](#volumes)
6. [Networks](#networks)
7. [Docker Compose](#docker-compose)
8. [Cleaning Up](#cleaning-up)
9. [Deprecated Features](#deprecated-features)
10. [Additional References](#additional-references)

---

### Instalação (pt-BR)

1. **Docker Desktop**: Disponível para [Mac](https://docs.docker.com/desktop/mac/install/), [Linux](https://docs.docker.com/desktop/linux/install/) e [Windows](https://docs.docker.com/desktop/windows/install/).

### Installation (en-US)

1. **Docker Desktop**: Available for [Mac](https://docs.docker.com/desktop/mac/install/), [Linux](https://docs.docker.com/desktop/linux/install/), and [Windows](https://docs.docker.com/desktop/windows/install/).

---

### Comandos Gerais (pt-BR)
- `docker --help`: Exibe informações de ajuda sobre comandos Docker.
- `docker info`: Mostra informações sobre o sistema Docker.
- `docker version`: Mostra a versão do Docker.

### General Commands (en-US)
- `docker --help`: Display help information about Docker commands.
- `docker info`: Show system-wide information about Docker.
- `docker version`: Display Docker version information.

---

### Imagens (pt-BR)
- `docker build -t <nome_da_imagem> .`: Cria uma imagem a partir de um Dockerfile.
- `docker images`: Lista todas as imagens locais.
- `docker rmi <nome_da_imagem>`: Remove uma imagem específica.
- `docker image prune`: Remove imagens não utilizadas.
- `docker pull <nome_da_imagem>`: Baixa uma imagem do registro.
- `docker push <nome_da_imagem>`: Envia uma imagem para o registro.

### Images (en-US)
- `docker build -t <image_name> .`: Build an image from a Dockerfile.
- `docker images`: List all local Docker images.
- `docker rmi <image_name>`: Remove a specific Docker image.
- `docker image prune`: Remove all unused images.
- `docker pull <image_name>`: Pull an image from a registry.
- `docker push <image_name>`: Push an image to a registry.

---

### Containers (pt-BR)
- `docker run --name <nome_container> <nome_imagem>`: Cria e inicia um container a partir de uma imagem.
- `docker ps`: Lista os containers em execução.
- `docker ps -a`: Lista todos os containers, incluindo os parados.
- `docker stop <nome_container>`: Para um container em execução.
- `docker start <nome_container>`: Inicia um container parado.
- `docker rm <nome_container>`: Remove um container parado.
- `docker exec -it <nome_container> sh`: Abre um shell dentro de um container em execução.

### Containers (en-US)
- `docker run --name <container_name> <image_name>`: Create and start a container from an image.
- `docker ps`: List running containers.
- `docker ps -a`: List all containers, including stopped ones.
- `docker stop <container_name>`: Stop a running container.
- `docker start <container_name>`: Start a stopped container.
- `docker rm <container_name>`: Remove a stopped container.
- `docker exec -it <container_name> sh`: Open a shell inside a running container.

---

### Volumes (pt-BR)
- `docker volume ls`: Lista todos os volumes Docker.
- `docker volume create <nome_volume>`: Cria um novo volume Docker.
- `docker volume rm <nome_volume>`: Remove um volume Docker.

### Volumes (en-US)
- `docker volume ls`: List all Docker volumes.
- `docker volume create <volume_name>`: Create a new Docker volume.
- `docker volume rm <volume_name>`: Remove a Docker volume.

---

### Redes (pt-BR)
- `docker network ls`: Lista todas as redes Docker.
- `docker network create <nome_rede>`: Cria uma nova rede Docker.
- `docker network connect <nome_rede> <nome_container>`: Conecta um container a uma rede.
- `docker network disconnect <nome_rede> <nome_container>`: Desconecta um container de uma rede.

### Networks (en-US)
- `docker network ls`: List all Docker networks.
- `docker network create <network_name>`: Create a new Docker network.
- `docker network connect <network_name> <container_name>`: Connect a container to a network.
- `docker network disconnect <network_name> <container_name>`: Disconnect a container from a network.

---

### Docker Compose (pt-BR)
- `docker compose up`: Cria e inicia containers para serviços definidos no YAML.
- `docker compose down`: Para e remove containers e redes criados.
- `docker compose build`: Compila ou recompila os serviços definidos.

### Docker Compose (en-US)
- `docker compose up`: Build and start containers for services defined in YAML.
- `docker compose down`: Stop and remove containers and networks created.
- `docker compose build`: Build or rebuild defined services.

---

### Limpeza (pt-BR)
- `docker system prune`: Remove containers, imagens e redes não utilizados.
- `docker volume prune`: Remove volumes não utilizados.

### Cleaning Up (en-US)
- `docker system prune`: Remove unused containers, images, and networks.
- `docker volume prune`: Remove unused volumes.

---

### Recursos Depreciados (pt-BR)

- Comandos e funções obsoletos podem ser encontrados na [documentação oficial](https://docs.docker.com/release-notes/).
- Exemplos incluem `docker-compose` (substituído por `docker compose`).

### Deprecated Features (en-US)

- Deprecated commands and functions can be reviewed in the [official documentation](https://docs.docker.com/release-notes/).
- Examples include `docker-compose` (replaced by `docker compose`).

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do Docker](https://docs.docker.com/)
- [Repositório GitHub do Docker](https://github.com/docker)

### Additional References (en-US)

- [Docker Official Documentation](https://docs.docker.com/)
- [Docker GitHub Repository](https://github.com/docker)
