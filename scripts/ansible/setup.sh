#!/usr/bin/env bash

set -ex

python -m venv env

env/bin/pip install -r dev-requirements.txt
