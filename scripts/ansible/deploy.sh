#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

set -x

cd ansible/

time ansible-playbook main.yml -K --vault-password-file .vault_pass $@
