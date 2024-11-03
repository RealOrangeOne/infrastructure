
export PATH := justfile_directory() + "/env/bin:" + env_var("PATH")

# Recipes
@default:
  just --list

ansible-setup: ansible-install ansible-galaxy-install

ansible-install:
    python -m venv env
    pip install -r ansible/dev-requirements.txt

ansible-galaxy-install: ansible-install
    cd ansible/ && ansible-galaxy install -r galaxy-requirements.yml --force

@ansible-facts HOST:
    cd ansible/ && ansible -m setup {{ HOST }} --vault-password-file=vault-pass.sh

# Run terraform with required environment
terraform +ARGS:
    #!/usr/bin/env bash
    cd terraform/

    # Load secrets from env file (if it exists)
    set -a
    source ./.env || true
    set +a

    terraform {{ ARGS }}

# Download secrets
update-secrets:
    bw sync
    cd terraform/ && bw get attachment .env --itemid c4f8b44e-ae62-442d-a9e0-02d0621c2454

ansible-deploy *ARGS: ansible-galaxy-install
    cd ansible/ && ansible-playbook main.yml --vault-password-file=vault-pass.sh -K --diff {{ ARGS }}

ansible-deploy-fast *ARGS:
    cd ansible/ && ansible-playbook main.yml --vault-password-file=vault-pass.sh -K --diff {{ ARGS }}

ansible-vault ACTION *ARGS:
    cd ansible/ && ansible-vault {{ ACTION }} --vault-password-file=vault-pass.sh {{ ARGS }}

terraform-lint:
    just terraform validate
    just terraform fmt -check -recursive

yamllint:
    yamllint -s .

ansible-lint: yamllint
    #!/usr/bin/env bash
    cd ansible/

    ansible-lint -p
    ansible-playbook main.yml --syntax-check

lint: terraform-lint ansible-lint
