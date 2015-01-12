# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

export CDPATH=".:~:~/dev:~/dev/work:~/dev/mm:~/dev/work/mm:~/dev/work/woa"

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

# Modify PATH
export PATH=$PATH:~/Applications/bin
export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH" # Add NPM binaries
export PATH=/usr/local/bin:$PATH
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH" # Add Postgres App bin
export PATH="$PATH:/Users/mortik/dev/work/mortik/tools/drush:/usr/local/bin"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=./bin:$PATH

# Set editor
export EDITOR=subl

#VirtualEnv
export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
export VIRTUALENV_DISTRIBUTE=true
export WORKON_HOME=~/Envs
. /usr/local/bin/virtualenvwrapper.sh

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
  scp ~/.dot-files/.bash_prompt $1:~/
}

#ansible hosts
export ANSIBLE_HOSTS=~/ansible_hosts
export ANSIBLE_SSH_ARGS="-o ForwardAgent=yes"

export MT_NO_EXPECTATIONS=yes

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
