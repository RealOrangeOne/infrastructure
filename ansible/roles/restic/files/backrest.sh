#!/usr/bin/env bash

set -e

export B2_ACCOUNT_ID="{{ restic_b2_account_id }}"
export B2_ACCOUNT_KEY="{{ restic_b2_account_key }}"
export RESTIC_PASSWORD="{{ restic_key }}"
export RESTIC_REPOSITORY="b2:{{ restic_b2_bucket }}"

export RESTIC_LOG_DIR="$HOME/log"
export RESTIC_LOG_FILE="$RESTIC_LOG_DIR/$(date -Iseconds).log"

mkdir -p "$RESTIC_LOG_DIR"

# Run backup, and capture logs to file
cron_backup() {
    curl -fsS -m 10 --retry 5 -o /dev/null {{ healthchecks_host }}/{{ healthchecks_id }}/start
    restic --verbose backup {{ restic_backup_locations|join(' ') }} | tee -a $RESTIC_LOG_FILE
    exit_code=${PIPESTATUS[0]}
    curl -fsS -m 10 --retry 5 -o /dev/null {{ healthchecks_host }}/{{ healthchecks_id }}/$exit_code --data-binary "@$RESTIC_LOG_FILE"
    rm $RESTIC_LOG_FILE
    echo "Exit code: $exit_code"
}

# Run backup, but show all the progress
backup() {
    restic --verbose backup {{ restic_backup_locations|join(' ') }}
}

# Forget legacy snapshots
forget() {
    set -x
    restic forget --keep-daily 7 --keep-weekly 2 $@
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
