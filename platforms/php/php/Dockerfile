#####
# This image builds upon Bref's compiled php
# Here we are going to fix a few things and replace a few others
# The result is an image where /opt contains everything required to execute PHP (+php-fpm, +composer)
# It also contains our generic bootstrap file
#####

## Composer
### We extract composer executable from this image
FROM composer:1.9.1 as target-composer

## PHP config
### We extract php's production-ready config file from this image
FROM php:7.4 as target-php

FROM bref/php-74-fpm-dev as base

### We need to switch to root to use yum
USER root

### For some reason, shadow-utils's commands (groupadd and the likes), aren't there, so we need to remove and install it again
### According to https://forums.aws.amazon.com/thread.jspa?messageID=755409&tstart=0, we need to install yum-plugin-ovl to avoid errors like "Rpmdb checksum is invalid"
### vim, htop, less and tree are utilities to work inside the container more comfortably
### git, zip and unzip are necessary for Composer to install dependencies
RUN     yum remove -y \
            shadow-utils \
    &&  yum install -y \
            shadow-utils \
            yum-plugin-ovl \
            vim htop less tree \
            git zip unzip

### Replace bref's config file with the oficial PHP image's config file
RUN rm /opt/bref/etc/php/conf.d/bref.ini
COPY --from=target-php /usr/local/etc/php/php.ini-production /opt/bref/etc/php/conf.d/php.ini

### Replace bref's Lambda executable bootstrap with our own
RUN rm /opt/bootstrap
COPY bootstrap /opt/bootstrap

### Add composer
COPY --from=target-composer /usr/bin/composer /opt/bin/composer

### Add /usr/sbin to the path
ENV PATH="/usr/sbin:${PATH}"

### Bref adds this env var. Remove it. AWS Lambda will add it when it's time
ENV LAMBDA_TASK_ROOT=""
