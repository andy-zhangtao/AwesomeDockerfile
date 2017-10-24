#!/bin/bash
docker run -ti --rm -v /opt/bin:/out ubuntu:16.10   /bin/bash -c "apt-get update && apt-get -y install make && cp /usr/bin/make /out/make"