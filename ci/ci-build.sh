#!/bin/bash
set -e

CIRCLE_PROJECT_REPONAME="greetingapp"
BUILD_NUMBER="1"

docker build \
    --build-arg container="$CIRCLE_PROJECT_REPONAME" \
    --build-arg container="$BUILD_NUMBER" \
    --rm=false --file "./ci/app.dockerfile" -t greetingapp .


echo "Build finished"