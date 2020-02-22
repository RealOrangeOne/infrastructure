# Infrastructure

![Ansible Status](https://github.com/realorangeone/infrastructure/workflows/Ansible/badge.svg)
![Terraform Status](https://github.com/realorangeone/infrastructure/workflows/Terraform/badge.svg)

## Requirements

- Python 3
- Locally configured SSH config (ideally deployed through [dotfiles](https://github.com/realorangeone/dotfiles))

## Installation

`./scripts/setup.sh`

### Private Settings

The ansible vault password needs setting in `ansible/.vault_pass`.

Terraform configuration needs to be placed in `terraform/secrets.auto.tfvars`.

Terraform backend secrets need to be placed in `terraform/secrets.sh`.

## Deploying

`./scripts/deploy.sh`

Alternatively, each component can be deployed separately:

- `./scripts/ansible.sh`
