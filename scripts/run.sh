#!/usr/bin/env bash

set -eu

echo
echo "Starting Provisioning..."
echo

ansible-playbook base.yml -e @vault.yml

echo
echo "Provisioning Finished!"
echo
