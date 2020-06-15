#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

set -x

python -m venv env

pip install -r ansible/dev-requirements.txt

cd ansible/ && ansible-galaxy install -r galaxy-requirements.yml
