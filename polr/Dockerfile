# How to deploy:
# - run a mysql docker
# - copy to the polr source (2.1.1) to the host's mounted directory
#
# TODO: figure out a way to populate the polr directory if it's empty (first time)
FROM ubuntu:16.04

MAINTAINER github.com/grokking-vietnam | github.com/exklm

RUN apt-get update \
    && apt-get install -y vim \
      git=1:2.7.4-0ubuntu1 \
      nginx=1.10.0-0ubuntu0.16.04.4 \
      php7.0-fpm=7.0.13-0ubuntu0.16.04.1 \
      php7.0-mysql=7.0.13-0ubuntu0.16.04.1 \
      php7.0-mbstring=7.0.13-0ubuntu0.16.04.1 \
      php7.0-xml=7.0.13-0ubuntu0.16.04.1 \
    && mkdir -p /var/run/php \
    && mkdir -p /var/www

COPY . /tmp

RUN cp /tmp/php.ini /etc/php/7.0/fpm/php.ini \
    && cp /tmp/composer.phar.1.3.2 /usr/bin/composer.phar \
    && service php7.0-fpm restart \
    && cp -r /tmp/polr /var/www/ \
    && cd /var/www/polr && /tmp/composer.phar.1.3.2 install --no-dev -o  \
    && cp /tmp/nginx.default /etc/nginx/sites-available/default \
    && chown -R www-data /var/www/polr \
    && rm -rf /var/lib/apt/lists/*

VOLUME /var/www/polr
EXPOSE 80 443

CMD ["nginx", "-g", "daemon  off;"]
