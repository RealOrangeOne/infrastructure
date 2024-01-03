#!/usr/bin/env bash

set -e

export B2_ACCOUNT_ID="{{ restic_b2_account_id }}"
export B2_ACCOUNT_KEY="{{ restic_b2_account_key }}"
export RESTIC_PASSWORD="{{ restic_key }}"
export RESTIC_REPOSITORY="b2:{{ restic_b2_bucket }}"
export GOGC=20  # HACK: Work around for restic's high memory usage https://github.com/restic/restic/issues/1988

set -x

exec restic $@
