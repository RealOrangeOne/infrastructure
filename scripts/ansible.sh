#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

set -x

cd ansible/

ansible-playbook --check main.yml -k -K --vault-password-file .vault_pass
