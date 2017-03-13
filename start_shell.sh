#!/usr/bin/env bash

set -e

if [ "x$1" = "x" ]; then
  echo "start_shell.sh <service_name>"
  echo "available services: ssp"
  exit 1
fi

if [ "x$(docker-compose ps -q $1)" = "x" ]; then
  docker-compose build $1
  docker-compose up -d $1
fi
docker exec -i -t `docker-compose ps -q $1` bash --login

exit 0
