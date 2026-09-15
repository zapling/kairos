REGISTRY := ghcr.io/zapling/kairos
BASE := ubuntu-26.04
YEAR_MONTH := $(shell date +%Y%m)
PATCH ?= 0

K3S_VERSIONS := \
	v1.36.4+k3s1 \
	v1.35.8+k3s1 \
	v1.34.11+k3s1 \
	v1.33.13+k3s1 \
	v1.32.13+k3s1 \
	v1.31.14+k3s1 \
	v1.30.13+k3s1 \
	v1.29.15+k3s1 \
	v1.28.15+k3s1 \
	v1.27.16+k3s1 \
	v1.27.5+k3s1

VERSION := v1.$(YEAR_MONTH).$(PATCH)

IMAGE := $(REGISTRY)/$(BASE)

.PHONY: build
build: $(K3S_VERSIONS)

.PHONY: $(K3S_VERSIONS)
$(K3S_VERSIONS):
	$(eval K3S_VERSION := $(subst +,-,$@))
	docker build . -f Containerfile \
		--build-arg VERSION=$(VERSION) \
		--build-arg K3S_VERSION=$@ \
		-t $(IMAGE)-$(K3S_VERSION):$(VERSION)
