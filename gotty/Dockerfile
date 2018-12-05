FROM alpine:3.4

RUN apk add --update go git && \
  mkdir -p /tmp/gotty && \
  GOPATH=/tmp/gotty go get github.com/yudai/gotty && \
  mv /tmp/gotty/bin/gotty /gotty && \
  apk del go git && \
  rm -rf /tmp/gotty /var/cache/apk/*