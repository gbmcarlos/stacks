.DEFAULT_GOAL := build
.PHONY: publish build lambda/extract lambda/publish

export DOCKER_BUILDKIT ?= 1

TAG := php

build:
	docker build \
	-t ${REPOSITORY}:${TAG} \
	--target base \
	${CURDIR}

# Empty publish because the parent make will push the docker image
publish: build
