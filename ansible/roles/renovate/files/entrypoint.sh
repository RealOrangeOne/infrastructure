#!/usr/bin/env bash

set -e

curl -fsSL https://github.com/aptible/supercronic/releases/download/v0.2.1/supercronic-linux-amd64 -o ~/supercronic

chmod +x ~/supercronic

# Ever 2 hours between 08:00 and 23:00
~/supercronic <(echo "0 8-23/2 * * *" renovate $@)
