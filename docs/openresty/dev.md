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