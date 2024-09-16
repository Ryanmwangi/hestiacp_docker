FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    mysql-server \
    nginx

RUN curl -s https://raw.githubusercontent.com/hestiacp/hestiacp/master/install.sh | bash

ENV HESTIA_DB_HOST=localhost
ENV HESTIA_DB_USER=root
ENV HESTIA_DB_PASSWORD=password
ENV HESTIA_DB_NAME=hestia

RUN mysql -h $HESTIA_DB_HOST -u $HESTIA_DB_USER -p$HESTIA_DB_PASSWORD $HESTIA_DB_NAME < /tmp/hestia.sql

EXPOSE 8083
VOLUME /var/www/hestiacp

CMD ["php", "-S", "0.0.0.0:8083", "-t", "/var/www/hestiacp"]