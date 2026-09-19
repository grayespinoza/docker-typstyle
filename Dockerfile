FROM alpine:3.23.4 AS base

ARG TYPSTYLE_VERSION=v0.15.0

RUN \
  apk add --no-cache \
    curl && \
  curl -fsSL -o \
    /tmp/typstyle \
    https://github.com/typstyle-rs/typstyle/releases/download/${TYPSTYLE_VERSION}/typstyle-x86_64-unknown-linux-musl && \
  chmod +x /tmp/typstyle

FROM alpine:3.23.4

COPY --from=base /tmp/typstyle /usr/local/bin/typstyle

ENTRYPOINT ["typstyle"]
