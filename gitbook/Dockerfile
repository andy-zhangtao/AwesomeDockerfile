FROM    node:11-alpine
RUN     npm install gitbook-cli -g && \
        mkdir /book && \
        gitbook init /book
VOLUME  [ "/book" ]
WORKDIR /book
ENTRYPOINT  ["gitbook","serve","/book"]
