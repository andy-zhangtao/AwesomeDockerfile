FROM golang:1.10-alpine
LABEL MAINTAINER=ztao@gmail.com
RUN apk update && \
    apk add libc6-compat ca-certificates wget openssl tzdata curl busybox-extras && \
    update-ca-certificates
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/sh","/entrypoint.sh"]
