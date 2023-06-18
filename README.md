# Infrastructure

## Requirements

- Python 3
- Locally configured SSH config (ideally deployed through [dotfiles](https://github.com/realorangeone/dotfiles))
- `ansible` installed on the system
- [`just`](https://github.com/casey/just)

## Installation

- `just setup`
- `just terraform init`

### Private Settings

Ansible [integrates](https://theorangeone.net/posts/ansible-vault-bitwarden/) with Bitwarden through its [CLI](https://bitwarden.com/help/article/cli/).

Terraform configuration needs to be placed in `terraform/secrets.auto.tfvars`.

Terraform backend secrets need to be placed in `terraform/secrets.sh`.

## Deploying

- `just ansible-deploy`
- `juts terraform apply`
