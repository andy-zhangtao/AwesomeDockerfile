FROM    golang:1.10-alpine3.7
LABEL   MAINTAINER=ztao@gmail.com
RUN		apk update && \
		apk add git expect curl tzdata && \
		go get -u github.com/golang/dep/cmd/dep && \
		cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
        echo "Asia/Shanghai" > /etc/timezone