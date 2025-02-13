FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    zip unzip git curl libonig-dev \
    libpq-dev libicu-dev \
    && docker-php-ext-configure gd \
    && docker-php-ext-install pdo pdo_mysql mysqli pdo_pgsql pgsql gd mbstring intl

RUN pecl install redis && docker-php-ext-enable redis

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY composer.json composer.lock /var/www/

WORKDIR /var/www

RUN composer install --no-dev --prefer-dist

COPY . /var/www

RUN chown -R www-data:www-data /var/www/writable /var/www/public
RUN chmod -R 775 /var/www/writable

CMD ["php-fpm"]
