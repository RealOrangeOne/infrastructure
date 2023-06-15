#!/usr/bin/env bash

set -ex

cd ansible/

time ansible-playbook main.yml --vault-password-file=vault-pass.sh -K $@
