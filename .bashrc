# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

export CDPATH=.:$HOME:$HOME/dev

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Modify PATH
export PATH=$PATH:$HOME/Applications/bin
export PATH=./node_modules/.bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH # Add NPM binaries
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=./bin:$PATH
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=/usr/local/heroku/bin:$PATH

# Android Setup
export ANDROID_HOME=$HOME/Library/Android/sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Set editor
export EDITOR=subl

# Ansible hosts
export ANSIBLE_HOSTS=$HOME/ansible_hosts
export ANSIBLE_SSH_ARGS="-o ForwardAgent=yes"

export MT_NO_EXPECTATIONS=yes

# Ruby Setup
if [ -e $(brew --prefix)/bin/rbenv ]; then
  export RBENV_ROOT=$(brew --prefix)/var/rbenv
  eval "$(rbenv init -)"
fi

ssh-add -A 2> /dev/null

# VM Setup
export VM_PATH=~/Documents/Virtual-Machines.localized

# Local definitions.
[ -e $HOME/.bashrc.local ] && source $HOME/.bashrc.local

# Alias definitions.
[ -e $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# Prompt definitions.
[ -e $HOME/.bash_prompt ] && source $HOME/.bash_prompt

# added by travis gem
[ -e $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
