FROM    alpine:latest
    
RUN     apk update && \
        apk add -y aria2 nginx git libc6-compat ca-certificates wget openssl && \
        update-ca-certificates

RUN     mkdir -p $HOME/.aria2 && \
        mkdir /run/nginx && \
        git clone https://github.com/ziahamza/webui-aria2.git /var/www/webui

RUN     wget -O /ac https://github.com/andy-zhangtao/aria2Client/releases/download/0.1/aria2Client && \
        chmod 755 /ac

COPY    aria2.conf      /root/.aria2/aria2.conf
COPY    default.conf    /etc/nginx/conf.d/default.conf
COPY    start.sh        /start.sh
COPY    hook.sh         /hook.sh
EXPOSE  80 6800

CMD     ["/start.sh"]