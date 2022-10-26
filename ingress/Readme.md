# Ingress

## How to download this image?

`docker pull vikings/nginx-ingress-controller-amd64:0.31.0`

## Why I need this docker image ?

This image contains ingress, deployed in kubernete. As a gateway, user maybe wants do some customize develop with lua.

Origin Ingress can not contain third library, like zlib, unzip, git and gcc etc.

So I build this image contains some develop library.

## What library this image contains ?

- common develop library

1. zlib zlib-dev unzip git gcc musl-dev lua

- lua develop library

1. lua-zlib

## Compare origin image, what it changed?

1. I modify reposity address, add `mirrors.ustc.edu.cn` to `/etc/apk/repositories`.
