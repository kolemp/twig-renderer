FROM alpine:3.8

RUN apk add --update php7 php7-phar php7-json php7-iconv php7-mbstring php7-openssl \
  && rm -rf /var/cache/apk/* 

ADD https://getcomposer.org/composer.phar /bin/composer
RUN chmod +x /bin/composer
RUN mkdir -p /var/lib/php/twig_renderer
COPY src/ /var/lib/php/twig_renderer/src/
COPY composer.json /var/lib/php/twig_renderer/
COPY tests /var/lib/php/twig_renderer/tests/

WORKDIR /var/lib/php/twig_renderer

RUN composer install --no-progress --no-suggest --no-dev -o

COPY renderer.php /bin/renderer.php
COPY entrypoint.sh /bin/entrypoint.sh

WORKDIR /data

ENTRYPOINT ["/bin/entrypoint.sh"]

