# Openresty Dev

基于Ubuntu 20.04的编译环境。 镜像名称为: `vikings/openresty:dev`。

Dockerfile如下:

```
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev  \
    libssl-dev perl make build-essential wget zlib1g-dev
```

适合使用默认`configure`的编译情况。

## 如何使用

假设本地需要构建`openresty-1.17.8.2`, 通过将本地openresty-1.17.8.2源码挂载到`vikings/openresty:dev`中，然后执行
```shell
configure && make && make install
```
就可以在`/usr/local/openresty/nginx/sbin/nginx`找到构建好的`openresty`

## 实例

下面是使用`dev`镜像进行本地构建的`Dockerfile`。

```Dockerfile
FROM vikings/openresty:dev as builder
COPY . /openresty
WORKDIR /openresty
RUN ./configure && \
    make && \
    make install

FROM ubuntu:20.04
COPY --from=builder /usr/local/openresty/nginx/sbin/nginx /usr/local/openresty/nginx/sbin/nginx
COPY --from=builder /usr/local/openresty/luajit/lib/libluajit-5.1.so.2.1.0 /usr/local/openresty/luajit/lib/libluajit-5.1.so.2
COPY --from=builder /usr/lib/x86_64-linux-gnu/libssl.so.1.1 /usr/lib/x86_64-linux-gnu/libssl.so.1.1
COPY --from=builder /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
```