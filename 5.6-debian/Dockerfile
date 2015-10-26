FROM azukiapp/debian
MAINTAINER Gullit Miranda <gullitmiranda@gmail.com>

# # Add PHP repository to apt source
# RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" \
#         > /etc/apt/sources.list.d/php5-5.6.list && \
#     apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C

# Install php5 + nginx
RUN apt-get update \
  && apt-get install -y -qq \
      nginx \
      unzip \
      libxml2 \
      libcurl4-openssl-dev \
      php5-dev \
      php5-cli \
      php5-mysql \
      php5-pgsql \
      php5-mcrypt \
      php5-curl \
      php5-json \
      php5-fpm \
      php5-gd \
      php-pear \
      php-apc \
      supervisor \
  && apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /docker
RUN /docker/script/prepare.sh

EXPOSE 80 443
VOLUME /docker/configuration

ENTRYPOINT ["/docker/script/entrypoint.sh"]
CMD ["nginx-php-fpm"]
