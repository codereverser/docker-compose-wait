# docker-compose-wait
Multi-arch container images with [docker-compose-wait](https://github.com/ufoscout/docker-compose-wait) pre-installed, for use in [folioman](https://github.com/codereverser/folioman)

- Based on Fedora 36
- docker-compose-wait is available at `/wait` 


## Build instructions

### single arch

```bash
docker build -t fc36-docker-compose-wait:latest .
```

### multi arch

```bash
docker buildx build --platform linux/arm/v7,linux/amd64 --tag IMAGE_URL:IMAGE_TAG --push .
```

ref: https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/
