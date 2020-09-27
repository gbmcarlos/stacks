#####
# This image builds upon Bref's compiled php
# Here we are going to fix a few things and replace a few others
# The result is an image where /opt contains everything required to execute PHP (+php-fpm, +composer)
# It also contains our generic bootstrap file
#####

FROM gbmcarlos/stacks:php-base as base

### Replace bref's Lambda executable bootstrap with our own
RUN rm /opt/bootstrap
COPY bootstrap /opt/bootstrap

### Bref adds this env var. Remove it. AWS Lambda will add it when it's time
ENV LAMBDA_TASK_ROOT=""
