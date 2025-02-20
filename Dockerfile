FROM php:8.1

RUN apt-get update
RUN apt-get install -qq git curl libmcrypt-dev libjpeg-dev libpng-dev \
    libfreetype6-dev libbz2-dev libzip-dev libicu-dev libxslt-dev librdkafka-dev
RUN apt-get clean

RUN pecl install mcrypt-1.0.5 xdebug rdkafka && docker-php-ext-enable mcrypt xdebug rdkafka
RUN docker-php-ext-install pdo_mysql zip gd intl xsl

RUN curl --silent --show-error "https://getcomposer.org/installer" | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install nodejs
