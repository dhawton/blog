#!/usr/bin/env bash

set -ex

HUB=${HUB:-"dhawton"}
TAG=${TAG:-"latest"}
IMG=${IMG:-"personal"}

hugo --minify
docker build -t $HUB/$IMG:$TAG .

if [[ -z "${DRY_RUN:-}" ]]; then
  docker push $HUB/$IMG:$TAG
fi
