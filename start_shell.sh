#!/usr/bin/env bash

set -e

if [ "x$(docker-compose ps -q clisp)" = "x" ]; then
  docker-compose build clisp
  docker-compose up -d clisp
fi
docker exec -i -t `docker-compose ps -q clisp` bash --login

exit 0
