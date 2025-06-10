FROM busybox:stable-musl AS builder
ARG ZOLA_VERSION=0.20.0
RUN wget -qO- https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz | tar xz

FROM debian:stable-slim
COPY --from=builder /zola /usr/bin/zola
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
