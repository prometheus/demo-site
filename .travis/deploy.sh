#!/bin/bash

export ANSIBLE_FORCE_COLOR=true

echo "Creating Vault-file: /tmp/vault"
/bin/cat <<EOM >/tmp/vault
${ANSIBLE_VAULT_PASSWORD}
EOM

ansible-playbook --vault-id /tmp/vault extras.yml site.yml
EXIT_CODE=$?

shred /tmp/vault

exit $EXIT_CODE
