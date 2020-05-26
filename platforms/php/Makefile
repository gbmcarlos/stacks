# Location of the docker images
base_php := base/php
base_php_nginx := base/php-nginx
stack_lumen := stacks/lumen
stack_laravel := stacks/laravel

# Group them as base and stack
base := $(base_php) $(base_php_nginx)
stacks := $(stack_lumen) $(stack_laravel)

# All of them together
images := $(base) $(stacks)

.PHONY: build $(base) $(stacks)

export REPOSITORY := gbmcarlos/stacks

# You can delegate 'publish' and 'build' targets
publish build: $(stacks)

# php-nginx depends on php
$(base_php_nginx): $(base)

# and the stacks depends on php-nginx
$(stacks): $(base_php_nginx)

# and the way to make each image os to sub-make them in the directory
$(images):
	$(MAKE) --directory=$@ $(TARGET)

lambda/publish:
	$(MAKE) --directory=$(base_php) lambda/publish