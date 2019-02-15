FROM    node:11-alpine
VOLUME  [ "/book" ]
RUN     npm install gitbook-cli -g
COPY    book.json /book/book.json
RUN     gitbook install /book && \
		gitbook init /book
WORKDIR /book
ENTRYPOINT  ["gitbook","serve","/book"]
