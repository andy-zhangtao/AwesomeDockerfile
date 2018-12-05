FROM    node:11-alpine
VOLUME  [ "/book" ]
RUN     npm install gitbook-cli -g
RUN     gitbook init /book
WORKDIR /book
ENTRYPOINT  ["gitbook","serve","/book"]
