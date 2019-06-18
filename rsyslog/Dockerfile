FROM vikings/alpine
RUN cd /etc/apk/keys; wget http://alpine.adiscon.com/rsyslog@lists.adiscon.com-5a55e598.rsa.pub ; echo -e '\nhttp://alpine.adiscon.com/3.7/stable\n' >> /etc/apk/repositories
RUN apk update && \
    apk add rsyslog && \
    rm -rf /var/cache/apk/*