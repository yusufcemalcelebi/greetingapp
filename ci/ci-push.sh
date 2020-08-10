#!/bin/bash
set -euo pipefail

docker login --username yusufcemalcelebi --password $DOCKER_HUB_ACCESS_KEY

docker tag yusufcemalcelebi/greetingapp yusufcemalcelebi/greetingapp:$CIRCLE_BUILD_NUM

docker push yusufcemalcelebi/greetingapp:$CIRCLE_BUILD_NUM

docker push yusufcemalcelebi/greetingapp:latest