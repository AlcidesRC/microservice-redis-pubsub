#------------------------------------------------------------------------------
# TARGET: BASE
#------------------------------------------------------------------------------
# Docker image based on Alpine Linux + Supervisor + PHP8-FPM
#------------------------------------------------------------------------------

FROM alpine:latest AS base

RUN apk --update add \
		#------------------------ Miscelaneous
		bash \
		ca-certificates \
		curl \
		gnu-libiconv \
		#------------------------ SupervisorD
		supervisor \
		#------------------------ PHP8
		php8 \
		php8-bcmath \
		php8-cli \
		php8-ctype \
		php8-curl \
		php8-dev \
		php8-dom \
		php8-exif \
		php8-fileinfo \
		php8-fpm \
		php8-gd \
		php8-gettext \
		php8-iconv \
		php8-intl \
		php8-json \
		php8-mbstring \
		php8-mysqli \
		php8-opcache \
		php8-openssl \
		php8-pdo \
		php8-pdo_mysql \
		php8-pdo_pgsql \
		php8-pdo_sqlite \
		php8-pear \
		php8-pecl-memcached \
		php8-phar \
		php8-posix \
		php8-redis \
		php8-session \
		php8-simplexml \
		php8-soap \
		php8-sockets \
		php8-sqlite3 \
		php8-tokenizer \
		php8-xml \
		php8-xmlreader \
		php8-xmlwriter \
		php8-zip \
		php8-zlib \
	&& rm -rf /tmp/* /var/cache/apk/* \
	&& ln -s /usr/bin/php8 /usr/bin/php

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so

COPY ./etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["supervisord", "--configuration", "/etc/supervisor/conf.d/supervisord.conf"]

#------------------------------------------------------------------------------
# TARGET: STANDALONE
#------------------------------------------------------------------------------
# Docker image based on Alpine Linux + Supervisor + PHP8-FPM (Supervised)
#------------------------------------------------------------------------------

FROM base AS standalone

COPY ./etc/supervisor/conf.d/php-fpm.conf /etc/supervisor/conf.d/php-fpm.conf
COPY ./etc/php8/php-fpm.d/www.conf /etc/php8/php-fpm.d/www.conf

HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD supervisorctl pid php8-fpm || exit 1

#------------------------------------------------------------------------------
# TARGET: WEBSERVER
#------------------------------------------------------------------------------
# Docker image based on Alpine Linux + Supervisor + PHP8-FPM (Supervised) + Nginx (Supervised)
#------------------------------------------------------------------------------

FROM standalone AS webserver

RUN apk --update add \
		nginx \
	&& rm /etc/nginx/conf.d/default.conf && mkdir -p /run/nginx

COPY ./etc/supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY ./etc/nginx/nginx.conf /etc/nginx/nginx.conf

HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD supervisorctl pid nginx || exit 1

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
