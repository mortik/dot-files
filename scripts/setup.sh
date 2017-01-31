#!/usr/bin/env bash

echo
echo "Starting Dotfiles Setup..."
echo

# brew
echo "Setup Brew..."
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update --all && brew upgrade && brew cleanup
fi

brew install git mas go forego tig heroku awscli rbenv terraform bash-completion ansible hub michaeldfallen/formula/git-radar

brew tap Homebrew/bundle
brew bundle

curl get.pow.cx | sh

# BashFiles
read -p "Setup bashrc files?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Setup Bashrc, Aliases and Prompt..."
  rm ~/.bashrc 2> /dev/null
  ln -s ~/.dotfiles/.bashrc ~/
  rm ~/.bash_aliases 2> /dev/null
  ln -s ~/.dotfiles/.bash_aliases ~/
  rm ~/.bash_profile 2> /dev/null
  ln -s ~/.dotfiles/.bash_profile ~/
  rm ~/.bash_prompt 2> /dev/null
  ln -s ~/.dotfiles/.bash_prompt ~/
fi

# git
read -p "Setup git?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Setup git..."
  rm ~/.gitignore_global 2> /dev/null
  ln -s ~/.dotfiles/.gitignore_global ~/
  rm ~/.gitmessage.txt 2> /dev/null
  ln -s ~/.dotfiles/.gitmessage.txt ~/

  if [ ! -f ~/.gitconfig ]; then
    cp ~/.dotfiles/gitconfig.tmp ~/.gitconfig
  fi
fi

# atom
read -p "Setup atom?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Setup atom..."
  rm ~/.atom/*.cson 2> /dev/null
  ln -s ~/.dotfiles/atom/*.cson ~/.atom/
  rm ~/.atom/*.coffee 2> /dev/null
  ln -s ~/.dotfiles/atom/*.coffee ~/.atom/
  rm ~/.atom/*.less 2> /dev/null
  ln -s ~/.dotfiles/atom/*.less ~/.atom/
  apm install --packages-file ~/.dotfiles/atom/packages.list
fi

# others
read -p "Setup vim, tig etc dotfiles?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Setup vim, tig, gem, eslint and rubocop..."
  rm ~/.vimrc 2> /dev/null
  ln -s ~/.dotfiles/.vimrc ~/
  rm ~/.tigrc 2> /dev/null
  ln -s ~/.dotfiles/.tigrc ~/
  rm ~/.gemrc 2> /dev/null
  ln -s ~/.dotfiles/.gemrc ~/
  rm ~/.eslintrc 2> /dev/null
  ln -s ~/.dotfiles/.eslintrc ~/
  rm ~/.rubocop.yml 2> /dev/null
  ln -s ~/.dotfiles/.rubocop.yml ~/
fi

read -p "Setup Github Auth-Token?" -n 1 -r
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
