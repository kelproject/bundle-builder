#!/bin/bash
set -ev

. $(dirname $(readlink -f $0))/common.sh

docker pull "$REPO" || true
docker build --tag "$REPO:$BUILD_TAG" .
