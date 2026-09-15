# TODO: Is this the version of kairos that will be installed?
FROM quay.io/kairos/kairos-init:v4.3.0 AS kairos-init

FROM ubuntu:26.04

# https://kairos.io/docs/reference/kairos-factory/#why-the-version-matters
ARG VERSION=v0.0.1
ARG K3S_VERSION

RUN --mount=type=bind,from=kairos-init,src=/kairos-init,dst=/kairos-init \
    /kairos-init -l debug -s install --version "${VERSION}" \
      --provider k3s --provider-k3s-version "${K3S_VERSION}"

RUN --mount=type=bind,from=kairos-init,src=/kairos-init,dst=/kairos-init \
    /kairos-init -l debug -s init --version "${VERSION}"
