FROM golang:1.12-alpine
ENV maintainer=ztao8607@gmail.com
COPY repositories /etc/apk/repositories
RUN apk update && \
    apk add -q gcc libc-dev libpcap-dev