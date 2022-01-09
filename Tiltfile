docker_compose('./docker-compose.yml')

local_resource('nomad acl setup', cmd="./nomad/bootstrap_acls.sh", resource_deps=["nomad","vault"])

local_resource('vault nomad integration', cmd="./vault/setup_nomad.sh", resource_deps=["vault", "nomad acl setup"])

local_resource('vault userpass setup', cmd="./vault/setup_userpass.sh", resource_deps=["vault", "vault nomad integration"])
