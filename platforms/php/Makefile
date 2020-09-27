# All the stacks together
stacks := php-base php php-nginx php-api php-web php-lambda

.PHONY: publish build $(stacks)
.DEFAULT_GOAL := build

export REPOSITORY := gbmcarlos/stacks

# Delegate publish, and then push all images
publish: $(stacks)
	docker push ${REPOSITORY}

# Delegate 'build' to each stack
build: $(stacks)

# php-api and php-web depend on php-nginx
php-api php-web: php-nginx

# php-nginx depends on php
php-nginx: $(php)

# php-nginx depends on php
php: $(php-base)

# The way to make each stack is to sub-make them in the directory
$(stacks):
	$(MAKE) -C $@ $(TARGET)
