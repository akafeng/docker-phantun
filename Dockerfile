FROM debian:bullseye-slim

LABEL \
    org.opencontainers.image.title="phantun" \
    org.opencontainers.image.authors="akafeng <i@sjy.im>" \
    org.opencontainers.image.source="https://github.com/akafeng/docker-phantun"

ARG PHANTUN_VERSION="0.2.0"
ARG PHANTUN_URL="https://github.com/dndx/phantun/releases/download/v${PHANTUN_VERSION}/phantun_x86_64-unknown-linux-gnu.zip"

ENV RUN_MODE="server"
ENV LOCAL_ADDR=
ENV REMOTE_ADDR=
ENV TUN_NAME=
ENV TUN_LOCAL=
ENV TUN_PEER=

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        ca-certificates \
        wget \
        unzip \
    && rm -rf /var/lib/apt/lists/* /var/log/* \
    \
    && wget -O phantun.zip ${PHANTUN_URL} \
    && unzip -d /usr/local/bin/ phantun.zip \
    && rm -rf phantun.zip

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
