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

Terraform secrets are stored in `terraform/.env`, and provisioned using `just update-secrets`.

## Deploying

- `just ansible-deploy`
- `juts terraform apply`

## External configuration

This repository contains most of my infrastructure configuration, but not everything is configured here. Some things are external, for various reasons.

- [AdGuardHome](https://git.theorangeone.net/systems/adguardhome)
