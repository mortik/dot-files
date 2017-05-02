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

brew tap Homebrew/bundle
brew install michaeldfallen/formula/git-radar
brew bundle

vagrant plugin install vagrant-vbguest vagrant-share

# BashFiles
read -p "Setup bash files?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Setup Bash"
  rm ~/.bash_profile 2> /dev/null
  ln -s ~/.dotfiles/.bash_profile ~/
  rm ~/.bashrc 2> /dev/null
  ln -s ~/.dotfiles/.bashrc ~/
  rm -rf ~/.bashrc.d 2> /dev/null
  ln -s ~/.dotfiles/.bashrc.d ~/
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
read -p "Setup sublime?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Setup sublime..."
  SUBLIME_PATH="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
  rm "$SUBLIME_PATH/Package Control.sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/Preferences.sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/JavaScript (Babel).sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/JavaScript.sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/JsPrettier.sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/Markdown.sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/GoSublime.sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/Ruby.sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/RuboCop.sublime-settings" 2> /dev/null
  rm "$SUBLIME_PATH/SublimeLinter.sublime-settings" 2> /dev/null
  ln -s ~/.dotfiles/sublime/*.sublime-settings "$SUBLIME_PATH/"
  ln -s ~/.dotfiles/sublime/*.sublime-build "$SUBLIME_PATH/"
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
