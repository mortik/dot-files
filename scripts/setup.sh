#!/usr/bin/env bash
echo
echo "Starting Setup..."
echo

# command line tools
xcode-select --install

# brew
echo "Setup Brew..."
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update --all && brew upgrade && brew cleanup
fi

if [ ! -f vault.yml ]; then
  cp vault.example.yml vault.yml
fi

echo
echo "Setup Finished!"
echo
