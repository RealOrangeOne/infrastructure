#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

yamllint -c ./yamllint.yml ./k8s
