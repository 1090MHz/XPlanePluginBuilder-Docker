# XPlanePluginBuilder-Docker
X-Plane Plugin Docker Build Environment

## Overview
This repository provides a Docker-based build environment for developing plugins for X-Plane. The Docker image is equipped with all the necessary tools and dependencies required to compile your plugin.

## Getting Started

### Prerequisites
Ensure Docker and Docker Compose are installed on your machine.

### Building the Docker Image

#### Using `docker build`
To construct the Docker image using `docker build`, execute the following command in the directory containing the Dockerfile:

```bash
docker build -t xplane-plugin-builder .
```
This command will generate a Docker image named `xplane-plugin-builder`.

#### Using `docker-compose`
To construct the Docker image using `docker-compose`, execute the following command in the directory containing the `docker-compose.yml` file:

```bash
docker-compose build
```

This command will generate the Docker image as defined in the [`docker-compose.yml`](./docker-compose.yml) file.

### Using the Docker Container

#### Using `docker run`
To compile your X-Plane plugin within the Docker container using `docker run`, use the following command:

```bash
docker run --rm -v ${PWD}:/usr/src/app xplane-plugin-builder bash -c "mkdir -p build && cd build && cmake .. && make"
```
This command mounts the current directory (`${PWD}`) to `/usr/src/app` inside the container and initiates the build process.

#### Using `docker-compose`
To start the service using `docker-compose`, run:

```bash
docker-compose up -d
```

To execute commands inside the running container, use `docker-compose exec`. For example, to start a bash shell in the container, run:

```bash
docker-compose exec xplane-plugin-builder bash
```

### Dockerfile Details
The Dockerfile carries out the following steps:
- Sets the official GCC image as the base.
- Installs build tools such as cmake, make, wget, and unzip.
- Sets the working directory to `/usr/src/app`.
- Downloads and extracts the X-Plane SDK.
- Copies the source code into the container.
- Builds the plugin by creating a build directory, running cmake, and compiling the plugin.
- Sets the entry point to bash.

## Notes
This setup assumes that your source code includes a `CMakeLists.txt` file for building the plugin. If your build process differs, adjust the Dockerfile and build commands accordingly.

## License
This project is licensed under the MIT License. Refer to the LICENSE file for more details.
