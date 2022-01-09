
#!/bin/bash

set -x
set -e

export VAULT_ADDR=http://127.0.0.1:8200/
export VAULT_TOKEN=test

# https://learn.hashicorp.com/tutorials/nomad/vault-nomad-secrets
vault secrets enable nomad

vault write nomad/config/access \
    address=http://nomad:4646 \
    token=$(cat state/nomad_bootstrap.json | jq -r '.SecretID')

vault write nomad/role/writer policies=write

vault write nomad/role/manager type=management global=true

cat << EOF | vault policy write nomad-writer-policy -
path "nomad/creds/writer" {
  capabilities = ["read"]
}
EOF

cat << EOF | vault policy write nomad-manager-policy -
path "nomad/creds/manager" {
  capabilities = ["read"]
}
EOF

vault token create -format=json -policy=nomad-writer-policy > state/creation_token.json

VAULT_TOKEN=$(cat state/creation_token.json | jq -r ".auth.client_token") vault read -format=json nomad/creds/writer