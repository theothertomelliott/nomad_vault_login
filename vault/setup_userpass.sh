#!/bin/bash

source vault/env.sh

export VAULT_TOKEN=test

vault auth enable userpass

vault write auth/userpass/users/demouser \
    password=password \
    policies=nomad-writer-policy