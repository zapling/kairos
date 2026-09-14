image := ghcr.io/zapling/kairos/ubuntu-26.04
tag := latest

build:
	docker build . -f Containerfile -t $(image):$(tag)
