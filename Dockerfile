FROM wordpress:php8.2-apache

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN echo "upload_max_filesize = 2G" > /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 2G" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "max_execution_time = 1200" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 1G" >> /usr/local/etc/php/conf.d/uploads.ini

RUN echo "RequestReadTimeout body=600,minrate=500" > /etc/apache2/conf-available/reqtimeout-custom.conf \
    && ln -sf /etc/apache2/conf-available/reqtimeout-custom.conf /etc/apache2/conf-enabled/reqtimeout-custom.conf \
    && rm -f /etc/apache2/conf-enabled/reqtimeout.conf
