#!/usr/bin/env bash

set -e

cd terraform/

terraform fmt -check -recursive
