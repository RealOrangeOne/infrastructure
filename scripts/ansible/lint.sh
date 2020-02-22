#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

set -x

yamllint -sc yamllint.yml ansible/

ansible-lint ansible/main.yml -p -c ansible/.ansible-lint

cd ansible/ && ansible-playbook main.yml --syntax-check
