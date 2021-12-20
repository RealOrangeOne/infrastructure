# Infrastructure

![CI](https://git.theorangeone.net/sys/infrastructure/badges/master/pipeline.svg)

## Requirements

- Python 3
- Locally configured SSH config (ideally deployed through [dotfiles](https://github.com/realorangeone/dotfiles))
- `ansible` installed on the system

## Installation

- `./scripts/ansible/setup.sh`
- `cd terraform/ && ./scripts/terraform/terraform.sh init`

### Private Settings

Ansible [integrates](https://theorangeone.net/posts/ansible-vault-bitwarden/) with Bitwarden through its [CLI](https://bitwarden.com/help/article/cli/).

Terraform configuration needs to be placed in `terraform/secrets.auto.tfvars`.

Terraform backend secrets need to be placed in `terraform/secrets.sh`.

## Deploying

- `./scripts/ansible/deploy.sh`
- `./scripts/terraform/terraform.sh apply`
