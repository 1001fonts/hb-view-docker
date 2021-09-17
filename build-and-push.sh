#!/usr/bin/env bash

docker buildx build \
        --platform linux/arm64/v8,linux/amd64 \
        --no-cache --pull \
        -t 1001fonts/hb-view:0.9.35-2 \
        --push .
