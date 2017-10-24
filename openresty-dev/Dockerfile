FROM ubuntu:17.10

RUN apt-get update && \
    apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev  \
    libssl-dev perl make build-essential wget

RUN wget https://openresty.org/download/openresty-1.11.2.3.tar.gz && \
    tar -zxvf openresty-1.11.2.3.tar.gz && \
    cd /openresty-1.11.2.3 && \
    ./configure && \
    make && \
    make install
     
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

CMD ["/usr/local/openresty/bin/openresty","-g","daemon off;"]