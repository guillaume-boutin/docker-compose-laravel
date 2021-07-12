FROM nginx:stable-alpine

RUN apk add acf-openssl

ARG UID=1000
ARG GID=1000
RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk --no-cache add shadow
RUN usermod -u ${UID} nginx && groupmod -g ${GID} nginx

RUN mkdir /etc/nginx/ssl
RUN chown -R nginx:nginx /etc/nginx/ssl

COPY ./create.sh /usr/local/bin/create
RUN chmod 775 /usr/local/bin/create

USER root

WORKDIR /etc/nginx
