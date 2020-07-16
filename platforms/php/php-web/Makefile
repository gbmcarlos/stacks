.DEFAULT_GOAL := build
.PHONY: publish build

export DOCKER_BUILDKIT ?= 1

TAG := php-web

build:
	docker build \
	-t ${REPOSITORY}:${TAG} \
	--target stack \
	${CURDIR}

# Empty publish because the parent make will push the docker image
publish: build