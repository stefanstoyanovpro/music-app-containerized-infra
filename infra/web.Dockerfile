FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libzip-dev unzip git \
 && docker-php-ext-install pdo pdo_mysql zip \
 && a2enmod rewrite

WORKDIR /var/www/html

COPY ../app/public/ ./

RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

RUN mkdir -p /var/music && chown -R www-data:www-data /var/music

EXPOSE 80
