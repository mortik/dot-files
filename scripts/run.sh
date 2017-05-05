#!/usr/bin/env bash

set -eu

echo
echo "Starting Provisioning..."
echo

tags=""
if [ -n "$1" ]; then
  tags="-t $1"
fi

ansible-playbook base.yml -e @vault.yml --ask-sudo-pass $tags

echo
echo "Provisioning Finished!"
echo
