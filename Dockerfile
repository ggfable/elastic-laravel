FROM php:8.1.7-fpm

RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libpq-dev \
    libzip-dev \
    webp \
    exif

RUN cd ~ && curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install nodejs
RUN npm install -g npm@8.16.0

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pecl install redis \
    && docker-php-ext-enable redis

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pdo_pgsql pgsql zip bcmath
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install gd exif

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/core

COPY ./app /var/www/core/

EXPOSE 9000

CMD ["php-fpm"]