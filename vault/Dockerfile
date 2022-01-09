FROM ubuntu

RUN apt-get update && \
      apt-get -y install sudo && \
      apt-get install -y unzip

# https://releases.hashicorp.com/vault/
ARG VAULT_VERSION=1.9.2
ARG PLATFORM=linux_arm64

ADD https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_${PLATFORM}.zip \
    vault_${VAULT_VERSION}_${PLATFORM}.zip
RUN unzip -d /bin vault_${VAULT_VERSION}_${PLATFORM}.zip \
  && chmod +x /bin/vault

EXPOSE 8200 8201

CMD vault server -dev -dev-listen-address=0.0.0.0:8200 -dev-root-token-id=test -config=/var/vault/vault.hcl