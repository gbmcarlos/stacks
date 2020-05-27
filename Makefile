# Location of the PHP platform
php := platforms/php

# List of all platforms
platforms := $(php)

.PHONY: publish build $(platforms)

export REPOSITORY := gbmcarlos/stacks

# Making all the stacks means making the stacks of each platform
publish build: $(platforms)

# Making a platform means sub-making (the given target) on that platform's directory
$(platforms):
	$(MAKE) --directory=$@ $(TARGET)