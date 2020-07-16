.DEFAULT_GOAL := build
.PHONY: publish build lambda/extract lambda/publish

export DOCKER_BUILDKIT ?= 1

TAG := php

build:
	docker build \
	-t ${REPOSITORY}:${TAG} \
	--target base \
	${CURDIR}

lambda/extract: build
	docker run \
	--rm \
	-v $(PWD):/var/mount \
	--entrypoint /bin/sh \
	${REPOSITORY}:${TAG} \
	-c "cd /opt; zip -r /var/mount/php-bin.zip ./bin ./bootstrap ./bref"
# Empty publish because the parent make will push the docker image
publish: build
