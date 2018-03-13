#!/usr/bin/env bash
echo
echo "Starting Setup..."
echo

# update
pacman -Syu

# install ansible
pacman -S ansible

if [ ! -f vault.yml ]; then
  cp vault.example-arch.yml vault.yml
fi

echo
echo "Setup Finished!"
echo
