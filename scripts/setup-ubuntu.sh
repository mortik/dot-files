#!/usr/bin/env bash
echo
echo "Starting Setup..."
echo

# update
sudo apt-get update && sudo apt-get upgrade

# install ansible
sudo apt-get install ansible

if [ ! -f vault.yml ]; then
  cp vault.example-linux.yml vault.yml
fi

echo
echo "Setup Finished!"
echo
