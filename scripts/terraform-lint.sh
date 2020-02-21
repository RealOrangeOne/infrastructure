#!/usr/bin/env bash

set -e

cd terraform/

set -x

terraform validate

terraform fmt -check -recursive
