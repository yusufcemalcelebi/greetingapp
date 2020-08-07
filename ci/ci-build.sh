#!/bin/bash
set -e

docker build \
    --build-arg container="$CIRCLE_PROJECT_REPONAME" \
    --build-arg container="$BUILD_NUMBER" \
    --rm=false --file "./ci/app.dockerfile" -t yusufcemalcelebi/greetingapp .


echo "Build finished"