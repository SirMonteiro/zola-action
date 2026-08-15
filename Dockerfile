FROM busybox:stable-musl AS builder
ARG ZOLA_VERSION=0.23.3
RUN wget -qO- https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-musl.tar.gz | tar xz

FROM alpine:3
COPY --from=builder /zola /usr/bin/zola
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
LABEL org.opencontainers.image.source https://github.com/SirMonteiro/zola-action \
      org.opencontainers.image.description="A debian-slim image to have zola SSG single bin with custom entrypoint parameters"
