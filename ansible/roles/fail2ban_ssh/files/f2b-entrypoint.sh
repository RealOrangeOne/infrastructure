#!/usr/bin/env bash

set -e

# Remove `-c` argument
shift

sudo fail2ban-client $@
