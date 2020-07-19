#####
# This image builds upon the base PHP+NGINX image
# Here we are going to 1) install Nodejs and 2) set the instructions necessary to have a full Laravel project running
# All these instrucionts will be executed on the downstream Dockerfile (the Dockerfile that uses this image as FROM)
#####

FROM gbmcarlos/stacks:php-nginx as stack

ARG NODEJS_VERSION=10

## Nodejs
RUN     curl -sL https://rpm.nodesource.com/setup_${NODEJS_VERSION}.x | bash - \
    &&  yum install -y nodejs

## NOM dependencies
### Install just the dependencies, without the code
ONBUILD COPY ./package* ./
ONBUILD RUN npm install

## Composer dependencies
### Install just the dependencies, without the code, so no need to dump the autoloader yet
ONBUILD COPY ./composer.* ./
ONBUILD RUN     composer global require \
                    -v --no-suggest --no-interaction --no-ansi \
                    hirak/prestissimo:0.3.8 \
            &&  composer install \
                    -v --no-autoloader --no-suggest --no-dev --no-interaction --no-ansi \
            &&  rm -rf /root/.composer

## Source code
ONBUILD COPY --chown=www:www ./src ./src

## Aggregate assets
ONBUILD COPY ./webpack.mix.js ./webpack.mix.js
ONBUILD RUN ./node_modules/webpack/bin/webpack.js \
                --hide-modules \
                --config=/var/task/node_modules/laravel-mix/setup/webpack.config.js \
                -p

## Composer autoloader
### Now that we've copied the source code, dump the autoloader, optimized by default
ONBUILD RUN composer dump-autoload -v --classmap-authoritative --no-dev --no-interaction --no-ansi

### Project-specific config files
ONBUILD COPY config/php.ini ./php/conf.d/php.ini
ONBUILD COPY config/php-fpm.ini ./php-fpm/conf.d/php-fpm.ini
ONBUILD COPY config/nginx.conf /etc/nginx/nginx.conf

## ENV VARS
### Release and other app-defining env vars
### PHP-FPM configuration
### Deployment configuration
ONBUILD ARG APP_RELEASE=latest
ONBUILD ENV APP_RELEASE=$APP_RELEASE \
    APP_NAME=localhost \
    APP_PORT=80 \
    BASIC_AUTH_ENABLED=true \
    BASIC_AUTH_USERNAME=admin \
    BASIC_AUTH_PASSWORD=${APP_NAME}"_password" \
    XDEBUG_ENABLED=false \
    XDEBUG_REMOTE_HOST=host.docker.internal \
    XDEBUG_REMOTE_PORT=10000 \
    XDEBUG_IDE_KEY=${APP_NAME}"_PHPSTORM" \
    MEMORY_LIMIT="128M" \
    PHP_FPM=dynamic \
    PHP_FPM_MAX_CHILDREN=100 \
    PHP_FPM_MAX_REQUESTS=500 \
    PHP_FPM_MIN_SPARE_SERVERS=16 \
    PHP_FPM_MAX_SPARE_SERVERS=32
