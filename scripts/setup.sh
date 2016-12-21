#!/usr/bin/env bash

echo
echo "Starting Dotfiles Setup..."
echo

# brew
echo
echo "Setup Brew"
echo
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update --all && brew upgrade && brew cleanup
fi

brew install git tig bash-completion ansible hub michaeldfallen/formula/git-radar

# BashFiles
echo
echo "Setup Bashrc, Aliases and Prompt"
echo
rm ~/.bashrc 2> /dev/null
ln -s ~/.dotfiles/.bashrc ~/
rm ~/.bash_aliases 2> /dev/null
ln -s ~/.dotfiles/.bash_aliases ~/
rm ~/.bash_profile 2> /dev/null
ln -s ~/.dotfiles/.bash_profile ~/
rm ~/.bash_prompt 2> /dev/null
ln -s ~/.dotfiles/.bash_prompt ~/

# git
echo
echo "Setup git"
echo
rm ~/.gitignore_global 2> /dev/null
ln -s ~/.dotfiles/.gitignore_global ~/
rm ~/.gitmessage.txt 2> /dev/null
ln -s ~/.dotfiles/.gitmessage.txt ~/

if [ ! -f ~/.gitconfig ]; then
  cp ~/.dotfiles/gitconfig.tmp ~/.gitconfig
fi

# atom
echo
echo "Setup atom"
echo
rm ~/.atom/*.cson 2> /dev/null
ln -s ~/.dotfiles/atom/*.cson ~/.atom/
rm ~/.atom/*.coffee 2> /dev/null
ln -s ~/.dotfiles/atom/*.coffee ~/.atom/
rm ~/.atom/*.less 2> /dev/null
ln -s ~/.dotfiles/atom/*.less ~/.atom/
apm install --packages-file ~/.dotfiles/atom/packages.list

# others
echo
echo "Setup vim and tig"
echo
rm ~/.vimrc 2> /dev/null
ln -s ~/.dotfiles/.vimrc ~/
rm ~/.tigrc 2> /dev/null
ln -s ~/.dotfiles/.tigrc ~/

read -p "Setup Github Auth-Token? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # Read Password
  echo -n Token:
  read -s token
  echo
  git config --global github.token ${token}
  echo
  echo "Github Auth-Token configured"
fi

echo
echo "Setup Finished!"
echo
