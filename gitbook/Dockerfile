FROM    node:11-alpine
WORKDIR /book
RUN     yarn global add gitbook-cli
COPY    book.json /book/book.json
RUN     gitbook install && \
		gitbook init /book
ENTRYPOINT  ["gitbook","serve","/book"]
