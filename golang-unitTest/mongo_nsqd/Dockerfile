FROM  vikings/golang:1.9-onbuild
RUN   apk --update add mongodb && \
      rm /usr/bin/mongoperf && \
      wget https://github.com/nsqio/nsq/releases/download/v1.0.0-compat/nsq-1.0.0-compat.linux-amd64.go1.8.tar.gz && \
      tar -zxvf nsq-1.0.0-compat.linux-amd64.go1.8.tar.gz && \
      mv nsq-1.0.0-compat.linux-amd64.go1.8/bin/* /usr/bin/ && \
      rm -rf nsq-1.0.0-compat.linux-amd64.go1.8
VOLUME 	/data/db
COPY  entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
