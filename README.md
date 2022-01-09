# Nomad + Vault

This repo demonstrates a simple setup with Nomad and Vault following a set of related tutorials.

It illustrates how a user can get a Nomad token using Vault from a single command.

This isn't supposed to demonstrate best practices, just a minimal example.

# Usage

To start and configure Nomad and Vault, use Tilt:

```
tilt up
```

Once all resources are running, you can authenticate to the Nomad UI as a user with:

```
./login_to_nomad_ui.sh
```

You will be prompted for a password for the `demouser` account, the password is `password`.
