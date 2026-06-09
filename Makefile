NODE_BASE_IMAGE = node:lts-alpine
GLIBC_VERSION = 2.34-r0
OSLS_VERSION = 3.74.0
OUTPUT_IMAGE = gkatanacio/oss-serverless:$(OSLS_VERSION)

.PHONY: build
build:
	docker build --no-cache \
		--build-arg NODE_BASE_IMAGE=$(NODE_BASE_IMAGE) \
		--build-arg GLIBC_VERSION=$(GLIBC_VERSION) \
		--build-arg OSLS_VERSION=$(OSLS_VERSION) \
		-t $(OUTPUT_IMAGE) .

.PHONY: push
push:
	docker push $(OUTPUT_IMAGE)

.PHONY: shell
shell:
	docker run --rm -it -v $(PWD):/opt/app $(OUTPUT_IMAGE) bash
