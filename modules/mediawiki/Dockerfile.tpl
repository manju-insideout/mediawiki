FROM php:7.4-apache
COPY mediawiki /var/www/html
COPY LocalSettings.php /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN apt-get update && apt-get install -y \
  libicu-dev \
  libxml2-dev \
  libssl-dev \
  libzip-dev
RUN docker-php-ext-install \
  intl \
  xml \
  mbstring \
  zip
