FROM casjaysdevdocker/golang AS builder

WORKDIR /app/gohttpserver
RUN apk -U upgrade && \
  apk add git && \
  git clone "https://github.com/codeskyblue/gohttpserver" ./ && \
  CGO_ENABLED=0 GOOS=linux go build -ldflags '-X main.VERSION=docker' -o gohttpserver && \
  chmod +x gohttpserver

FROM casjaysdevdocker/alpine:latest
ARG BUILD_DATE="$(date +'%Y-%m-%d %H:%M')"
LABEL \
  org.label-schema.name="gohttpserver" \
  org.label-schema.description="Alpine based image with gohttpserver." \
  org.label-schema.url="https://hub.docker.com/r/casjaysdevdocker/gohttpserver" \
  org.label-schema.vcs-url="https://github.com/casjaysdevdocker/gohttpserver" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.version=$BUILD_DATE \
  org.label-schema.vcs-ref=$BUILD_DATE \
  org.label-schema.license="WTFPL" \
  org.label-schema.vcs-type="Git" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.vendor="CasjaysDev" \
  maintainer="CasjaysDev <docker-admin@casjaysdev.com>"

COPY --from=builder /app/gohttpserver/gohttpserver /usr/local/bin/gohttpserver
COPY ./data/. /data/
#COPY ./config/. /config/
COPY ./bin/. /usr/local/bin/

WORKDIR /data/htdocs

EXPOSE 19065

HEALTHCHECK --interval=15s --timeout=3s CMD [ "/usr/local/bin/entrypoint-gohttpserver.sh", "healthcheck" ]
ENTRYPOINT [ "/usr/local/bin/entrypoint-gohttpserver.sh"]
