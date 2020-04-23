#!/usr/bin/env bash

set -e

for compose_file in /opt/**/docker-compose.yml; do
    if [[ ! $(docker-compose -f $compose_file ps -q) ]]; then
        docker-compose -f $compose_file up -d
    else
        echo "> Skipping $compose_file as it's running."
    fi
done
