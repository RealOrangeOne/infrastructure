#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

cd ansible/

set -x

yamllint -sc yamllint.yml .

ansible-lint main.yml -p -c .ansible-lint --exclude galaxy_roles/

ansible-playbook main.yml --syntax-check
