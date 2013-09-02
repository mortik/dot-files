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
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH" # Add Postgres App bin

# Set editor
export EDITOR=vim

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

export PROMPT_COMMAND='__git_prompt "⦧ \
\t \
\[\e[31m\]\h \
\[\e[32m\]\W\
\[\e[00m\]" "\
\[\e[34m\] \
› \
\[\e[00m\]"'

# sync script
function scp-dotfiles () {
  if [ -z "$1" ]; then
    echo -n "\[\e[31m\]you doing it wrong!\[\e[00m\]"
    return
  fi
  echo -n $'syncing files to '
  echo -n "\[\e[32m\]"
  echo -n $1
  echo "\[\e[00m\]"
  scp ~/.dot-files/.srv_bashrc $1:~/.bashrc
  scp ~/.dot-files/.srv_bash_aliases $1:~/.bash_aliases
  scp ~/.dot-files/.gitconfig $1:~/.gitconfig
  scp ~/.dot-files/git-prompt $1:~/.git-prompt
}

#ansible hosts
export ANSIBLE_HOSTS=~/ansible_hosts
