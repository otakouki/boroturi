FROM php:7.3-fpm
COPY php.ini /usr/local/etc/php
RUN apt-get update && docker-php-ext-install mysqli pdo_mysql
