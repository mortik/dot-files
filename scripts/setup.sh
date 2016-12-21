#!/usr/bin/env bash

# brew
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update --all && brew upgrade && brew cleanup
fi

brew install git tig bash-completion ansible hub michaeldfallen/formula/git-radar

# BashFiles
rm ~/.bashrc 2> /dev/null
ln -s ~/.dotfiles/.bashrc ~/
rm ~/.bash_aliases 2> /dev/null
ln -s ~/.dotfiles/.bash_aliases ~/
rm ~/.bash_profile 2> /dev/null
ln -s ~/.dotfiles/.bash_profile ~/
rm ~/.bash_prompt 2> /dev/null
ln -s ~/.dotfiles/.bash_prompt ~/

# git
rm ~/.gitignore_global 2> /dev/null
ln -s ~/.dotfiles/.gitignore_global ~/
rm ~/.gitmessage.txt 2> /dev/null
ln -s ~/.dotfiles/.gitmessage.txt ~/

if [ ! -f ~/.gitconfig ]; then
  cp ~/.dotfiles/gitconfig.tmp ~/.gitconfig
fi

# atom
rm ~/.atom/*.cson 2> /dev/null
ln -s ~/.dotfiles/atom/*.cson ~/.atom/
rm ~/.atom/*.coffee 2> /dev/null
ln -s ~/.dotfiles/atom/*.coffee ~/.atom/
rm ~/.atom/*.less 2> /dev/null
ln -s ~/.dotfiles/atom/*.less ~/.atom/
apm install --packages-file ~/.dotfiles/atom/packages.list

# others
rm ~/.vimrc 2> /dev/null
ln -s ~/.dotfiles/.vimrc ~/
rm ~/.tigrc 2> /dev/null
ln -s ~/.dotfiles/.tigrc ~/
