#!/usr/bin/env bash

set -ex

./scripts/terraform/terraform.sh validate

./scripts/terraform/terraform.sh fmt -check -recursive
