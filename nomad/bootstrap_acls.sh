#!/bin/bash

set -x
set -e

# Wait until Nomad is up
while ! echo exit | curl -f http://localhost:4646; do sleep 2; done

nomad acl bootstrap -json > state/nomad_bootstrap.json

# Extract token
export NOMAD_TOKEN=$(cat state/nomad_bootstrap.json | jq -r '.SecretID')

# Set up policies
nomad acl policy apply -description "Anonymous policy (full-access)" anonymous nomad/anonymous.policy.hcl
nomad acl policy apply -description "Write access" write nomad/write.policy.hcl
