.DEFAULT_GOAL := build
.PHONY: publish build lambda/extract lambda/publish

export DOCKER_BUILDKIT ?= 1

TAG := php

publish: build
	docker push ${REPOSITORY}:${TAG}

build:
	docker build \
	-t ${REPOSITORY}:${TAG} \
	--target base \
	.

# TODO: implement publishing to AWS Lambda
lambda/publish: lambda/extract
	echo "Published PHP Lambda layer"

lambda/extract: build
	docker run \
	--rm \
	-v $(PWD):/var/mount \
	--entrypoint /bin/sh \
	${REPOSITORY}:${TAG} \
	-c "cd /opt; zip -r /var/mount/php-bin.zip ./*"
