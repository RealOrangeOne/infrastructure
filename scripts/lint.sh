#!/usr/bin/env bash

set -e

PATH=env/bin:${PATH}

set -x

yamllint -sc yamllint.yml yamllint.yml .github/
