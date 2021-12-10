#!/usr/bin/env bash
VERSION_SHORT=$1
VERSION=$2
docker buildx build --push --platform linux/amd64,linux/arm64 --file Dockerfile --tag spoofi/alpine-helm:latest --tag spoofi/alpine-helm:${VERSION} --tag spoofi/alpine-helm:${VERSION_SHORT} --build-arg VERSION=${VERSION} .