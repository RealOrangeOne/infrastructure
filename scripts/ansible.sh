#!/usr/bin/env bash

set -e

PATH=env/bin:${PATH}

ansible-playbook -i ansible/hosts ansible/main.yml -k -K --vault-password-file ansible/.vault_pass
