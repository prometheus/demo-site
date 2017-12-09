#!/bin/bash
echo "Creating Vault-file: /tmp/vault"
/bin/cat <<EOM >/tmp/vault
${ANSIBLE_VAULT_PASSWORD}
EOM

ansible-playbook --vault-id /tmp/vault site.yml

shred /tmp/vault
