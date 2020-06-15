#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

set -x

yamllint -sc ansible/yamllint.yml ansible/

ansible-lint ansible/main.yml -p -c ansible/.ansible-lint --exclude ansible/galaxy_roles/

cd ansible/ && ansible-playbook main.yml --syntax-check
