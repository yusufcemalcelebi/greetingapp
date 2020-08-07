#!/bin/bash
set -euo pipefail

docker login --username yusufcemalcelebi --password $DOCKER_HUB_ACCESS_KEY

docker tag greetingapp greetingapp:$CIRCLE_BUILD_NUM
docker tag greetingapp greetingapp:latest

docker push yusufcemalcelebi/greetingapp:$CIRCLE_BUILD_NUM