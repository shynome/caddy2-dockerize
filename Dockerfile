ARG VERSION=2.3.0

FROM golang:1.15-alpine as Build
ARG VERSION
RUN apk add --no-cache git build-base
WORKDIR /app
COPY . /app
RUN cd cmd/caddy/ && go build -mod=vendor -o /tmp/caddy

# copy from https://github.com/caddyserver/caddy-docker/blob/master/2.3/alpine/Dockerfile
FROM alpine:3.12 as Base

RUN apk add --no-cache ca-certificates mailcap

RUN set -eux; \
	mkdir -p \
		/config/caddy \
		/data/caddy \
		/etc/caddy \
		/usr/share/caddy \
	;

# https://github.com/caddyserver/caddy/releases
ENV CADDY_VERSION v${VERSION}

# set up nsswitch.conf for Go's "netgo" implementation
# - https://github.com/docker-library/golang/blob/1eb096131592bcbc90aa3b97471811c798a93573/1.14/alpine3.12/Dockerfile#L9
RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

# See https://caddyserver.com/docs/conventions#file-locations for details
ENV XDG_CONFIG_HOME /config
ENV XDG_DATA_HOME /data

VOLUME /config
VOLUME /data

LABEL org.opencontainers.image.version=v${VERSION}
LABEL org.opencontainers.image.title=Caddy
LABEL org.opencontainers.image.description="a powerful, enterprise-ready, open source web server with automatic HTTPS written in Go"
LABEL org.opencontainers.image.url=https://caddyserver.com
LABEL org.opencontainers.image.documentation=https://caddyserver.com/docs
LABEL org.opencontainers.image.licenses=Apache-2.0
LABEL org.opencontainers.image.source="https://github.com/shynome/caddy2-dockerize"

EXPOSE 80
EXPOSE 443
EXPOSE 2019

WORKDIR /srv

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

COPY --from=Build /tmp/caddy /usr/bin/caddy
