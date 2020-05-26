.DEFAULT_GOAL := build
.PHONY: publish build

export DOCKER_BUILDKIT ?= 1

TAG := laravel

publish: build
	docker push ${REPOSITORY}:${TAG}

build:
	docker build \
	-t ${REPOSITORY}:${TAG} \
	--target stack \
	.
