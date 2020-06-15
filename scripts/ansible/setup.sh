#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

set -x

python -m venv env

cd ansible/

pip install -r dev-requirements.txt

ansible-galaxy install -r galaxy-requirements.yml
