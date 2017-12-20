FROM 	python:2-alpine3.7
LABEL 	maintainer=ztao8607@gmail.com
RUN 	echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositorie && \
    	apk --update --force add libc6-compat ca-certificates wget openssl tzdata privoxy@edge && \
    	update-ca-certificates
RUN 	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    	echo $TZ > /etc/timezone
RUN 	pip install shadowsocks
COPY 	privoxy.config /privoxy.config
COPY 	start.sh /start.sh
EXPOSE 	1080 8118
ENTRYPOINT ["/start.sh"]