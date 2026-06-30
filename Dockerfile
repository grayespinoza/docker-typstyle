FROM alpine:3.23.4 AS base

ARG TYPSTYLE_VERSION=v0.15.0

RUN apk add --no-cache curl

RUN \
  curl -fsSL -o \
    /tmp/typstyle \
    https://github.com/typstyle-rs/typstyle/releases/download/${TYPSTYLE_VERSION}/typstyle-x86_64-unknown-linux-musl

FROM alpine:3.23.4

COPY --from=base /tmp/typstyle /usr/local/bin/typstyle
RUN chmod +x /usr/local/bin/typstyle
ENTRYPOINT ["typstyle"]
