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
export PATH="/usr/local/share/npm/bin:$PATH" # Add NPM binaries
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Set editor
export EDITOR=vim

DEFAULT_COLOR="[00m"
BLUE_COLOR="[34m"
DARK_RED_COLOR="[36m"
GRAY_COLOR="[37m"
PINK_COLOR="[35m"
GREEN_COLOR="[32m"
ORANGE_COLOR="[33m"
RED_COLOR="[31m"

set_color() {
  echo -n $' \e'
  echo -n $1
}

ruby_version() {
  ruby -v | awk '{print $2}'
}

parse_ruby() {
  echo -n $' '
  echo -n $(set_color $RED_COLOR)
  echo -n $(ruby_version)
  echo -n $(set_color $DEFAULT_COLOR)
}

parse_virtualenv() {
  if [ x$VIRTUAL_ENV != x ]; then
    echo -n $' '
    if [[ $VIRTUAL_ENV == *.virtualenvs/* ]]; then
      ENV_NAME=$(basename "${VIRTUAL_ENV}")
    else
      folder=$(dirname "${VIRTUAL_ENV}")
      ENV_NAME=$(basename "$folder")
    fi
    echo -n $(set_color $RED_COLOR)
    echo -n $ENV_NAME
    echo -n $(set_color $DEFAULT_COLOR)
  fi
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

export BASEPROMPT='\t \
\e${DARK_RED_COLOR}\h \
\e${GREEN_COLOR}\W\
\e${DEFAULT_COLOR}\
$(__git_prompt)\
$(parse_virtualenv)\
\e${BLUE_COLOR}\
 › \
\e${DEFAULT_COLOR}'
export PS1=$BASEPROMPT

# sync script
function scp-dotfiles () {
  if [ -z "$1" ]; then
    echo -n $(set_color $RED_COLOR)
    echo -n "you doing it wrong!"
    echo $(set_color $DEFAULT_COLOR)
    return
  fi
  echo -n $'syncing files to '
  echo -n $(set_color $GREEN_COLOR)
  echo -n $1
  echo $(set_color $DEFAULT_COLOR)
  scp ~/.dot-files/.srv_bashrc $1:~/.bashrc
  scp ~/.dot-files/.srv_bash_aliases $1:~/.bash_aliases
  scp ~/.dot-files/.gitconfig $1:~/.gitconfig
}

#ansible hosts
export ANSIBLE_HOSTS=~/ansible_hosts
