# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.git-prompt ]; then
  . ~/.git-prompt
fi

# Modify PATH
export PATH=$PATH:~/Applications/bin
export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH" # Add NPM binaries
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH" # Add Postgres App bin
export PATH="$PATH:/Users/mortik/dev/work/mortik/tools/drush:/usr/local/bin"

# Set editor
export EDITOR=vim

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

#VirtualEnv
export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
export VIRTUALENV_DISTRIBUTE=true
export WORKON_HOME=~/Envs
. /usr/local/bin/virtualenvwrapper.sh

export PROMPT_COMMAND='__git_prompt "⦧ \
\t \
\[\e[31m\]\h \
\[\e[32m\]\W\
\[\e[00m\]" "\
\[\e[34m\] \
› \
\[\e[00m\]"'


DEFAULT="\e[0;30m"
RED="\[\033[0;31m\]"
GREEN="\e[32m"
# sync script
function scp-dotfiles () {
  if [ -z "$1" ]; then
    echo "you doing it wrong!"
    return
  fi
  echo -n $'syncing files to: '
  echo $1
  scp ~/.dot-files/.srv_bashrc $1:~/.bashrc
  scp ~/.dot-files/.srv_bash_aliases $1:~/.bash_aliases
  scp ~/.dot-files/.gitconfig $1:~/.gitconfig
  scp ~/.dot-files/git-prompt $1:~/.git-prompt
}

#ansible hosts
export ANSIBLE_HOSTS=~/ansible_hosts
