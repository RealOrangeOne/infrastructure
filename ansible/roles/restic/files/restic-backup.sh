#!/usr/bin/env bash

set -e

exec $HOME/backrest.sh --verbose backup --files-from=$HOME/restic-include.txt --exclude-file=$HOME/restic-excludes.txt
