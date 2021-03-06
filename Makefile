# Location of the PHP platform
php := platforms/php

# List of all platforms
platforms := $(php)

# The available targets and the default target
.PHONY: publish build $(platforms)
.DEFAULT_GOAL := build

export REPOSITORY := gbmcarlos/stacks

# Delegate publish and build
publish build: $(platforms)

# Making a platform means sub-making (the given target) on that platform's directory
$(platforms):
	$(MAKE) -C $@ $(TARGET)