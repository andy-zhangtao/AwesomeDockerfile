FROM    codercom/code-server
USER root
WORKDIR /root
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:longsleep/golang-backports && \
    apt-get update && \
    apt-get install -y curl vim make iputils-ping wget golang-go go-dep

# golang 1.12
RUN   wget https://github.com/andy-zhangtao/shadow-rest/releases/download/v0.1.8/shadowsocks-local-linux64-1.1.5.gz -O /root/shadowsocks-local-linux64-1.1.5.gz && \
    gunzip /root/shadowsocks-local-linux64-1.1.5.gz && \
    chmod 755 /root/shadowsocks-local-linux64-1.1.5

RUN     go get -u github.com/mdempsky/gocode && \
    go get github.com/uudashr/gopkgs/cmd/gopkgs && \
    go get github.com/ramya-rao-a/go-outline && \
    go get github.com/acroca/go-symbols && \
    go get golang.org/x/tools/cmd/guru && \
    go get golang.org/x/tools/cmd/gorename && \
    go get github.com/go-delve/delve/cmd/dlv && \
    go get github.com/stamblerre/gocode && \
    go get github.com/rogpeppe/godef && \
    go get github.com/sqs/goreturns && \
    go get golang.org/x/lint/golint