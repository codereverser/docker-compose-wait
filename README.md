# docker-compose-wait
Multi-arch container images with [docker-compose-wait](https://github.com/ufoscout/docker-compose-wait) pre-installed, for use in [folioman](https://github.com/codereverser/folioman)

- Based on debian:stable
- docker-compose-wait is available at `/wait` 

## Usage

Pre-built images for `amd64`,`arm64` and `arm` are available at [Docker Hub](https://hub.docker.com/r/codereverser/docker-compose-wait)


## Local Build instructions

### single arch

```bash
docker build -t debian-docker-compose-wait:latest .
```

### multi arch

```bash
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 --tag IMAGE_URL:IMAGE_TAG --push .
```

ref: https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/
