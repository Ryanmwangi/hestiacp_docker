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

