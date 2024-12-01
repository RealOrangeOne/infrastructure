#!/usr/bin/env bash

set -e

export AWS_ACCESS_KEY_ID="{{ restic_b2_account_id }}"
export AWS_SECRET_ACCESS_KEY="{{ restic_b2_account_key }}"
export RESTIC_PASSWORD="{{ restic_key }}"
export RESTIC_REPOSITORY="s3:{{ restic_b2_endpoint }}/{{ restic_b2_bucket }}"
export GOGC=20  # HACK: Work around for restic's high memory usage https://github.com/restic/restic/issues/1988

set -x

exec restic $@
