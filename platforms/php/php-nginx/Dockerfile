#####
# This image builds upon the base PHP image
# Here we are going to 1) install and configure nginx and 2) install the init script, which will start and controll Nginx and PHP-FPM
# The result is an image upon which we can run PHP web applications
# It also contains our generic bootstrap file
#####

FROM gbmcarlos/stacks:php as base

## System dependencies
RUN     yum clean all \
    &&  yum update -y \
    &&  yum install -y \
            nginx

### Set up nginx's permissions
RUN     groupadd www \
    &&  adduser -g www www \
    &&  mkdir -p /var/tmp/nginx \
    &&  chown -R www:www /var/tmp/nginx

### Copy the init script
COPY init.sh /var/task/bin/init.sh

### By default, execute the init.sh script
CMD ["/bin/sh", "-c", "/var/task/bin/init.sh"]

WORKDIR /var/task

