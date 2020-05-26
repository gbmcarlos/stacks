.DEFAULT_GOAL := build
.PHONY: publish build

export DOCKER_BUILDKIT ?= 1

TAG := php-nginx

publish: build
	docker push ${REPOSITORY}:${TAG}

build:
	docker build \
	-t ${REPOSITORY}:${TAG} \
	--target base \
	.
