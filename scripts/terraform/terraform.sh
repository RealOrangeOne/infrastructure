#!/usr/bin/env bash

set -ex

cd terraform/

source secrets.sh || true

terraform $@
