#!/usr/bin/env bash

set -e

export B2_ACCOUNT_ID="{{ restic_b2_account_id }}"
export B2_ACCOUNT_KEY="{{ restic_b2_account_key }}"
export RESTIC_PASSWORD="{{ restic_key }}"
export RESTIC_REPOSITORY="b2:{{ restic_b2_bucket }}"

export RESTIC_LOG_DIR="$HOME/log"
export RESTIC_LOG_FILE="$RESTIC_LOG_DIR/$1-$(date -Iseconds).log"

export FORGET_OPTIONS="--keep-daily 30"

mkdir -p "$RESTIC_LOG_DIR"

# Run backup, and capture logs to file
cron_backup() {
    curl -fsS -m 10 --retry 5 -o /dev/null {{ healthchecks_host }}/{{ restic_healthchecks_id }}/start
    restic --verbose backup --files-from=$HOME/restic-include.txt --exclude-file=$HOME/restic-excludes.txt | tee -a $RESTIC_LOG_FILE
    exit_code=${PIPESTATUS[0]}
    curl -fsS -m 10 --retry 5 -o /dev/null {{ healthchecks_host }}/{{ restic_healthchecks_id }}/$exit_code --data-binary "@$RESTIC_LOG_FILE"
    echo "Exit code: $exit_code"
}

# Run backup, but show all the progress
backup() {
    restic --verbose backup --files-from=$HOME/restic-include.txt --exclude-file=$HOME/restic-excludes.txt
}

{% if restic_forget %}
# Run forget and prune, and capture logs to file
cron_forget() {
    curl -fsS -m 10 --retry 5 -o /dev/null {{ healthchecks_host }}/{{ restic_forget_healthchecks_id }}/start
    restic forget --prune $FORGET_OPTIONS | tee -a $RESTIC_LOG_FILE
    exit_code=${PIPESTATUS[0]}
    curl -fsS -m 10 --retry 5 -o /dev/null {{ healthchecks_host }}/{{ restic_forget_healthchecks_id }}/$exit_code --data-binary "@$RESTIC_LOG_FILE"
    echo "Exit code: $exit_code"
}
{% endif %}

# Forget legacy snapshots
forget() {
    set -x
    restic forget $FORGET_OPTIONS $@
}

# Prune orphaned files
prune() {
    set -x
    restic --verbose prune $@
}

# Run restic, but with environment variables set
exec () {
    set -x
    restic $@
}

# Run the things
"$@"
