FROM alpine:latest

RUN apk update && \
    apk add libc6-compat ca-certificates wget openssl tzdata curl busybox-extras && \
    update-ca-certificates bash
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
COPY pprof /pprof
COPY repositories /etc/apk/repositories
