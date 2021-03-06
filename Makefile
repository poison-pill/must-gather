IMAGE_REGISTRY ?= quay.io
IMAGE_TAG ?= latest

# MUST_GATHER_IMAGE needs to be passed explicitly 
ifndef MUST_GATHER_IMAGE
$(error MUST_GATHER_IMAGE is not set.)
endif

build: docker-build docker-push

# check
check:
	shellcheck collection-scripts/*

docker-build:
	docker build -t ${IMAGE_REGISTRY}/${MUST_GATHER_IMAGE}:${IMAGE_TAG} .

docker-push:
	docker push ${IMAGE_REGISTRY}/${MUST_GATHER_IMAGE}:${IMAGE_TAG}

.PHONY: build docker-build docker-push
