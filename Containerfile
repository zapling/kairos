# TODO: Is this the version of kairos that will be installed?
FROM quay.io/kairos/kairos-init:v0.17.3 AS kairos-init

FROM ubuntu:26.04

# TODO: Is this my image version?
ARG VERSION=v0.0.1

RUN --mount=type=bind,from=kairos-init,src=/kairos-init,dst=/kairos-init \
    /kairos-init -l debug -s install --version "${VERSION}" && \
    /kairos-init -l debug -s init --version "${VERSION}"
