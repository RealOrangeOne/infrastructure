# Infrastructure

![CI Status](https://github.com/realorangeone/infrastructure/workflows/CI/badge.svg)

## Requirements

- Python 3
- Locally configured SSH config (ideally deployed through [dotfiles](https://github.com/realorangeone/dotfiles))
- `ansible` installed on the system

## Installation

- `./scripts/ansible/setup.sh`
- `cd terraform/ && ./scripts/terraform/terraform.sh init`

### Private Settings

The ansible vault password needs setting in `ansible/.vault_pass`.

Terraform configuration needs to be placed in `terraform/secrets.auto.tfvars`.

Terraform backend secrets need to be placed in `terraform/secrets.sh`.

## Deploying

- `./scripts/ansible/deploy.sh`
- `./scripts/terraform/terraform.sh apply`
