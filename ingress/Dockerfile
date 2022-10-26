FROM vikings/nginx-ingress-controller-amd64:0.30.0
USER root
RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN  apk add  zlib zlib-dev unzip git gcc musl-dev && \
    git config --global http.sslVerify "false" && \
    luarocks install lua-zlib
USER www-data