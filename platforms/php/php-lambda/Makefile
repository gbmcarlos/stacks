.DEFAULT_GOAL := build
.PHONY: extract build publish

TAG := php

# Run an ephemeral container of PHP to extract the necessary files into a zip
build:
	docker run \
	--rm \
	-v ${CURDIR}:/var/mount \
	--entrypoint /bin/sh \
	${REPOSITORY}:${TAG} \
	-c "cd /opt; zip -r /var/mount/php-runtime.zip ./bin ./bootstrap ./bref"

# Package the SAM template
publish: build
	aws cloudformation package \
 	--template-file sam.yaml \
 	--s3-bucket ${SAM_ARTIFACTS_BUCKET} \
 	--output-template-file sam-output.yaml
