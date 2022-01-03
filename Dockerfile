FROM php:7.3-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN apt-get update && apt-get install -y zip unzip && rm -rf /var/lib/apt/lists/*
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY . .
RUN /usr/local/bin/composer install && a2enmod rewrite
