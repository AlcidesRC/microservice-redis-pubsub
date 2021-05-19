#------------------------------------------------------------------------------
# DEPLOYMENT DOCKERFILE
#------------------------------------------------------------------------------

#FROM __REPOSITORY_URI_FROM_CONTAINER_REGISTRY__
FROM standalone

COPY ./etc/supervisor/conf.d/subscriber.conf /etc/supervisor/conf.d/subscriber.conf

COPY ./src /code

WORKDIR /code

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
	composer update --no-dev --no-interaction --no-progress --optimize-autoloader && \
	composer dump-auto --no-dev --optimize && \
	rm /usr/bin/composer

HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD supervisorctl pid subscriber || exit 1
