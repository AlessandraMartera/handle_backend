FROM php:8.3-fpm

ARG USER

RUN apt-get update && apt-get install -y libmcrypt-dev mariadb-client openssl zip unzip git gnupg libcurl3-gnutls wget 
RUN docker-php-ext-install pdo_mysql
RUN pecl install xdebug-3.3.0
RUN docker-php-ext-enable xdebug

COPY ./custom.d/php.ini /usr/local/etc/php/conf.d/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN mkdir -p /home/$USER
RUN groupadd -g 1000 $USER
RUN useradd -u 1000 -g $USER $USER -d /home/$USER
RUN chown $USER:$USER /home/$USER

WORKDIR /var/www

USER $USER