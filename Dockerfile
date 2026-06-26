FROM wordpress:php8.2-apache

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN echo "upload_max_filesize = 2G" > /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 2G" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "max_execution_time = 1200" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 512M" >> /usr/local/etc/php/conf.d/uploads.ini
