#!/bin/bash

source vault/env.sh

# Log out of vault
rm -f ~/.vault-token

vault login -method=userpass username=demouser

NOMAD_USER_TOKEN=$(vault read -format=json nomad/creds/writer | tee /dev/tty | jq -r ".data.secret_id")

nomad ui -authenticate -token=${NOMAD_USER_TOKEN}