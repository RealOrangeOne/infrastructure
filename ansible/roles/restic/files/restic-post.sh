#!/usr/bin/env bash

# See https://restic.readthedocs.io/en/stable/080_examples.html#backing-up-your-system-without-running-restic-as-root

set -e

RESTIC_BIN=$(which restic)

# Set owner
chown root:restic $RESTIC_BIN
chmod 750 $RESTIC_BIN

# Lest restic run root things
setcap cap_dac_read_search=+ep $RESTIC_BIN
