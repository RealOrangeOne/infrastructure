#!/usr/bin/env bash

set -ex

cd terraform/

bw get attachment secrets.sh --itemid c4f8b44e-ae62-442d-a9e0-02d0621c2454
bw get attachment secrets.auto.tfvars --itemid c4f8b44e-ae62-442d-a9e0-02d0621c2454
