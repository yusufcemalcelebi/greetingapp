#!/bin/bash
set -euo pipefail

docker login --username yusufcemalcelebi --password $DOCKER_HUB_ACCESS_KEY

docker push yusufcemalcelebi/greetingapp:latest

docker push yusufcemalcelebi/greetingapp:$CIRCLE_BUILD_NUM