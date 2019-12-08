#!/usr/bin/env bash

set -e

PATH=env/bin:${PATH}

set -x

yamllint -sc yamllint.yml yamllint.yml ansible/

ansible-lint ansible/main.yml -p -c ansible/.ansible-lint

ansible-playbook -i ansible/hosts ansible/main.yml --syntax-check
