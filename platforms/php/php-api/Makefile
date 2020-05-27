.DEFAULT_GOAL := build
.PHONY: publish build

export DOCKER_BUILDKIT ?= 1

TAG := php-api

build:
	docker build \
	-t ${REPOSITORY}:${TAG} \
	--target stack \
	.
