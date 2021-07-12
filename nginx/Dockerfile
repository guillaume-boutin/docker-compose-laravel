FROM nginx:stable-alpine

ARG UID=1000
ARG GID=1000
RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk --no-cache add shadow
RUN usermod -u ${UID} nginx && groupmod -g ${GID} nginx

USER root

WORKDIR /etc/nginx
