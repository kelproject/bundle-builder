#!/bin/bash
set -ev

. $(dirname $(readlink -f $0))/common.sh

docker login -e noemail -u $QUAY_USERNAME -p $QUAY_PASSWORD quay.io
docker tag -f "$REPO:$BUILD_TAG" "$REPO:latest"
docker push "$REPO:$BUILD_TAG"
docker push "$REPO:latest"
