# syntax=docker/dockerfile:1
FROM ghcr.io/gohugoio/hugo:v0.163.1 AS build

WORKDIR /app

USER root

COPY . .

RUN --mount=type=cache,sharing=locked,target=/hugo_cache \
    hugo build --gc --minify --cacheDir /hugo_cache

FROM scratch AS final

ARG UID=1001
COPY --chown=$UID:0 --chmod=775 --from=build  /app/public /

ARG VERSION
ARG REVISION
LABEL org.opencontainers.image.ref.name="golb"
LABEL org.opencontainers.image.vendor="FOBshippingpoint"
LABEL org.opencontainers.image.description="CC Lan's blog"
LABEL org.opencontainers.image.url="https://github.com/FOBshippingpoint/golb"
LABEL org.opencontainers.image.version=${VERSION}
LABEL org.opencontainers.image.revision=${REVISION}
