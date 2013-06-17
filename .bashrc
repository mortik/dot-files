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

# Modify PATH
export PATH=$PATH:~/Applications/bin

# Set editor
export EDITOR=vim

DEFAULT_COLOR="[00m"
BLUE_COLOR="[34m"
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

git_branch() {
  if [[ $(git branch) ]]; then
    echo -n $(git rev-parse --abbrev-ref HEAD)
  else
    echo -n '(new-repo)'
  fi
}

git_remote() {
  echo -n $(git config branch.$1.remote)
}

parse_git_upstream_dirty() {
  if [[ $(git status --porcelain | grep "^??") ]] >& /dev/null; then
    echo -n $(set_color $ORANGE_COLOR)
    echo -n $'●'
  fi
  if ! [[ "$(git status | tail -n1)" =~ "nothing to commit" ]]; then
    echo -n $(set_color $RED_COLOR)
    echo -n $'*'
  fi
  if [[ $(git log $(git_remote $1)/$1..$1) ]] >& /dev/null; then
    echo -n $(set_color $GREEN_COLOR)
    echo -n $'▵'
  fi
  echo -n $(set_color $DEFAULT_COLOR)
}

parse_git_branch() {
  if [[ $(git ls-files) ]] >& /dev/null; then
    git_branch=$(git_branch)
    echo -n $' ['
    echo -n $git_branch
    echo -n $(parse_git_upstream_dirty $git_branch)
    echo -n $']'
  fi
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

export BASEPROMPT='\n\e${BLUE_COLOR}\h \
\e${GREEN_COLOR}\w\
\e${DEFAULT_COLOR}\
$(parse_ruby)\
$(parse_git_branch)\
$(parse_virtualenv)'
export PS1="${BASEPROMPT}
[\t] $ "

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
