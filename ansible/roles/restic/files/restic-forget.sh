#!/usr/bin/env bash

set -e

exec $HOME/backrest.sh forget --prune --keep-daily 30 --keep-monthly 3 --group-by host
