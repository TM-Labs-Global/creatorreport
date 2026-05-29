ARG BASE_IMAGE=php:8.2-apache
FROM ${BASE_IMAGE}

RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

WORKDIR /var/www/html

RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

EXPOSE 80