#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

yamllint -sc ansible/yamllint.yml ansible

cd ansible/

ansible-lint -p

ansible-playbook main.yml --syntax-check
