FROM vikings/nginx:vts
COPY repositories /etc/apk/repositories
RUN apk update && \
    apk add logrotate libc6-compat ca-certificates wget openssl tzdata curl busybox-extras && \
    update-ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone