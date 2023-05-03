#!/usr/bin/env bash

set -e

cd terraform/

# Load secrets from env file (if it exists)
set -a
source ./.env || true
set +a -x

terraform $@
