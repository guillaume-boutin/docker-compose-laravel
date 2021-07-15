FROM php:7.4-fpm

# COPY ../code/composer.json ../code/composer.lock /var/www/

WORKDIR /var/www

# Download script to install PHP extensions and dependencies
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
      curl \
      git \
      zip \
      unzip \
      nano \
      ghostscript

RUN install-php-extensions \
      bcmath \
      bz2 \
      calendar \
      exif \
      gd \
      imagick \
      intl \
      ldap \
      memcached \
      mysqli \
      opcache \
      pdo_mysql \
      pdo_pgsql \
      pgsql \
      redis \
      soap \
      xsl \
      zip \
      sockets \
      pdo_sqlsrv \
      sqlsrv \
      mailparse \
      pcntl

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing permissions from folder to docker
COPY --chown=www:www . /var/www
RUN chown -R www-data:www-data /var/www

#upload
RUN echo "file_uploads = On" >> /usr/local/etc/php/conf.d/uploads.ini
RUN echo "memory_limit = 100M" >> /usr/local/etc/php/conf.d/uploads.ini
RUN echo "upload_max_filesize = 100M" >> /usr/local/etc/php/conf.d/uploads.ini
RUN echo "post_max_size = 100M" >> /usr/local/etc/php/conf.d/uploads.ini

# Enable read|write on PDF
RUN sed -i 's/domain="coder" rights="none" pattern="PDF"/domain="coder" rights="read|write" pattern="PDF"/g' /etc/ImageMagick-6/policy.xml

USER www

EXPOSE 9000