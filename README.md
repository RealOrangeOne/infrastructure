# Infrastructure

![Ansible Status](https://github.com/realorangeone/infrastructure/workflows/Ansible/badge.svg)
![Generic Linting](https://github.com/realorangeone/infrastructure/workflows/Lint/badge.svg)

## Requirements

- Python 3
- Locally configured SSH config (ideally deployed through [dotfiles](https://github.com/realorangeone/dotfiles))

## Installation

`./scripts/setup.sh`

### Private Settings

The ansible vault password needs setting in `ansible/.vault_pass`.

## Deploying

`./scripts/deploy.sh`

Alternatively, each component can be deployed separately:

- `./scripts/ansible.sh`
