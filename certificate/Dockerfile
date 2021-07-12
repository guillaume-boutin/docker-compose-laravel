FROM alpine:3.14

RUN addgroup -g 1000 cert
RUN adduser -u 1000 -G cert -h /home/cert -D cert

RUN apk add acf-openssl

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk --no-cache add shadow

COPY ./create.sh /usr/local/bin/create
RUN chmod 775 /usr/local/bin/create

USER cert

WORKDIR /home/cert