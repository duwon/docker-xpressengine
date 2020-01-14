# --------------------------------------------------
#  Dockerfile for installing XpressEngine 3
# --------------------------------------------------

FROM php:7.4-apache

MAINTAINER Duwon Jung <duwonet@gmail.com>

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y \
    sudo \
    wget \
    unzip \
    ca-certificates \
    apt-transport-https \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \    
    zlib1g-dev \
    libpng-dev \
    libcurl4-openssl-dev \
    python \
    python-pip \
    libzip-dev \
    zip \
    libonig-dev

# Install required PHP extensions for XpressEngine
RUN set -x \
    && docker-php-ext-configure gd -with-freetype --with-jpeg

RUN set -x \
    && docker-php-ext-install gd mysqli pdo pdo_mysql zip mbstring tokenizer curl fileinfo iconv

# Enableing the Apache2 rewrite module
RUN set -x \
    && a2enmod rewrite

# Install jinja2-cli for templating the `.xe_install_config.yaml` file
RUN set -x \
    && pip install --no-cache-dir jinja2-cli

# Cleanup
RUN set -x \
    && rm -rf /var/lib/apt/lists/*

COPY files  /var/www/html
RUN chmod +x /var/www/html/entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/var/www/html/entrypoint.sh"]

CMD ["apache2-foreground"]
