#!/usr/bin/env bash

# Log Each command
set -x

if [[ $SKIP_BUILD -ne "1" ]]; then
  yarn build-storybook
fi

BASEDIR=$(dirname $0)
REPO_ROOT_DIR="$(dirname $( cd "$BASEDIR" ; pwd -P ))"
CURR_VERSION=$(node -p "require('${REPO_ROOT_DIR}/package.json').version")
STORYBOOK_PORT=$(npx --no-install get-port)

CORES=$(getconf _NPROCESSORS_ONLN)
HALF_CORES=$(( ($CORES + (2 - 1)) / 2))

DOCKER_STORYBOOK_SERVER_CONTAINER_ID=$(docker run -d --rm \
  -p $STORYBOOK_PORT:8080 \
  -v $REPO_ROOT_DIR/storybook-static:/web \
  halverneus/static-file-server:v1.8.2
)

BROWSERLESS_PORT=$(npx --no-install get-port)
DOCKER_BROWSERLESS_CONTAINER_ID=$(docker run -d --rm \
  -p $BROWSERLESS_PORT:3000 \
  -e "CONNECTION_TIMEOUT=-1" \
  -e "MAX_CONCURRENT_SESSIONS=$HALF_CORES" \
  browserless/chrome:1.48.0-chrome-stable
)

# Run test
BROWSERLESS_PORT=$BROWSERLESS_PORT STORYBOOK_PORT=$STORYBOOK_PORT \
  npx --no-install jest 'test/storyshots.test.js' --maxWorkers=$HALF_CORES

JEST_EXIT_CODE=$?

docker kill $DOCKER_STORYBOOK_SERVER_CONTAINER_ID
docker kill $DOCKER_BROWSERLESS_CONTAINER_ID

exit $JEST_EXIT_CODE
