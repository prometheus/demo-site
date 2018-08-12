#!/bin/bash

export ANSIBLE_FORCE_COLOR=true
export ANSIBLE_CALLBACK_PLUGINS="$(python -c 'import os,ara; print(os.path.dirname(ara.__file__))')/plugins/callbacks"

echo "Creating Vault-file: /tmp/vault"
/bin/cat <<EOM >/tmp/vault
${ANSIBLE_VAULT_PASSWORD}
EOM

ansible-playbook --vault-id /tmp/vault extras.yml #site.yml
EXIT_CODE=$?

# Copy ARA static files
ara generate html ara
tar cf ara.tgz ara
ansible --vault-id /tmp/vault -m unarchive -a "src=ara.tgz dest=/var/www/demo/" web

shred /tmp/vault

exit $EXIT_CODE
