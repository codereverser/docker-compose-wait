FROM --platform=$BUILDPLATFORM rust:latest AS original

FROM original as builder
ARG TARGETARCH
ARG DOCKER_COMPOSE_WAIT_VERSION=2.9.0
ARG DOCKER_COMPOSE_WAIT_URL=https://github.com/ufoscout/docker-compose-wait.git

COPY docker/platform.sh .
RUN ./platform.sh # should write /.platform and /.compiler

RUN rustup component add rustfmt
RUN rustup target add $(cat /.platform)
RUN apt-get update && apt-get install -y git unzip $(cat /.compiler)
RUN git clone ${DOCKER_COMPOSE_WAIT_URL} && \
    cd docker-compose-wait && \
    git checkout ${DOCKER_COMPOSE_WAIT_VERSION}
COPY docker/config .cargo/config
WORKDIR /docker-compose-wait
RUN cargo build --target $(cat /.platform) --release
RUN cp target/$(cat /.platform)/release/wait /wait
RUN $(cat /.strip) /wait

FROM debian:stable-slim
COPY --from=builder /wait /wait
