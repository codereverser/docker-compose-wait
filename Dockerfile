FROM fedora:36 AS original

FROM original as builder
ARG DOCKER_COMPOSE_WAIT_VERSION=2.9.0
ARG DOCKER_COMPOSE_WAIT_URL=https://github.com/ufoscout/docker-compose-wait.git

# Splitting dnf rules to avoid timeouts in multi-arch mode
RUN dnf -yv install git
RUN dnf -yv install gcc g++ 
RUN dnf -yv install cargo
RUN git clone ${DOCKER_COMPOSE_WAIT_URL} && \
    cd docker-compose-wait && \
    git checkout ${DOCKER_COMPOSE_WAIT_VERSION}
WORKDIR /docker-compose-wait
RUN cargo build --release && strip target/release/wait


FROM original as final
COPY --from=builder /docker-compose-wait/target/release/wait /wait
