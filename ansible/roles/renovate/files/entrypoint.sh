#!/usr/bin/env bash

set -e

while true;
do
    renovate $@
    echo "> Sleeping for 1 hour..."
    sleep 1h &
    wait $!
done
