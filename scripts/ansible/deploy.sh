#!/usr/bin/env bash

set -ex

cd ansible/

time ansible-playbook main.yml -K --vault-password-file .vault_pass $@
