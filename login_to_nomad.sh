#!/bin/bash

set -x
set -e

source vault/env.sh

vault login -method=userpass username=demouser

NOMAD_USER_TOKEN=$(vault read -format=json nomad/creds/writer | tee /dev/tty | jq -r ".data.secret_id")

nomad ui -authenticate -token=${NOMAD_USER_TOKEN}