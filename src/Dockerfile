FROM php:7.4-fpm
WORKDIR /code
COPY apt/sources.list /home/sources.list


RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak  \
    && cat /etc/apt/sources.list.bak \
    && mv /home/sources.list /etc/apt/sources.list \
    && apt-get update && apt-get install -y gnupg2 \
    && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 7638D0442B90D010 \
    && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com CBF8D6FD518E17E1 \
    && apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip \
    && cd /tep \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && composer selfupdate

