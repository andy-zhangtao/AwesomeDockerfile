FROM alpine:latest

RUN apk update && \
    apk add libc6-compat ca-certificates wget openssl tzdata && \
    update-ca-certificates
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
