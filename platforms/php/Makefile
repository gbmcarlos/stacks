# All the stacks together
stacks := php php-nginx php-api php-web

.PHONY: publish build $(stacks)

export REPOSITORY := gbmcarlos/stacks

publish: build
	docker push ${REPOSITORY}

# Delegate 'build' to each stack
build: $(stacks)

# php-api and php-web depend on php-nginx
php-api php-web: php-nginx

# php-nginx depends on php
php-nginx: $(php)

# The way to make each stack is to sub-make them in the directory
$(stacks):
	$(MAKE) --directory=$@ $(TARGET)

# extra target to extract the /opt folder of the lambda-compatible base php stack
lambda/publish:
	$(MAKE) --directory=php lambda/publish