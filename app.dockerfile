FROM php:8.2

RUN docker-php-ext-install pdo pdo_mysql
