#!/usr/bin/env bash
echo
echo "Starting Setup..."
echo

# update
sudo apt update && sudo apt -yq upgrade

# install ansible
sudo apt -yq install ansible

if [ ! -f vault.yml ]; then
  cp vault.example-linux.yml vault.yml
fi

echo
echo "Setup Finished!"
echo
