ARG BUILD_FROM=ghcr.io/hassio-addons/ubuntu-base:8.2.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

WORKDIR /app

RUN apk del alpine-baselayout
RUN wget https://github.com/puxos/alpine-pkg-glibc/releases/download/2.30-r0-x86_64/glibc-2.30-r0.apk
RUN wget https://github.com/puxos/alpine-pkg-glibc/releases/download/2.30-r0-x86_64/glibc-bin-2.30-r0.apk
RUN wget https://github.com/puxos/alpine-pkg-glibc/releases/download/2.30-r0-x86_64/glibc-dev-2.30-r0.apk
RUN wget https://github.com/puxos/alpine-pkg-glibc/releases/download/2.30-r0-x86_64/glibc-i18n-2.30-r0.apk
RUN apk add --allow-untrusted glibc-2.30-r0.apk glibc-bin-2.30-r0.apk glibc-dev-2.30-r0.apk glibc-i18n-2.30-r0.apk
RUN export LD_LIBRARY_PATH=./lib/

RUN apk add --no-cache python3

RUN wget https://github.com/airsquared/blobsaver/releases/download/v3.5.0/blobsaver-3.5.0.tar.gz
RUN tar xvf blobsaver-3.5.0.tar.gz

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT [ "./start.sh" ]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="dedins" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="dedins" \
    org.opencontainers.image.authors="dedins" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
