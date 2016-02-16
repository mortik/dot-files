# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

export CDPATH=".:~:~/dev:~/dev/work"

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
export PATH=$PATH:~/Applications/bin
export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH" # Add NPM binaries
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=./bin:$PATH
export PATH=$PATH:~/.composer/vendor/bin
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Set editor
export EDITOR=atom

# VirtualEnv
if [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ]; then
  export VIRTUALENVWRAPPER_PYTHON=`which python`
  export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
  export VIRTUALENV_DISTRIBUTE=true
  export WORKON_HOME=~/Envs
  . /usr/local/bin/virtualenvwrapper_lazy.sh
fi

#android
export ANDROID_HOME="$HOME/dev/android/android-sdk-macosx"
export PATH="$PATH:~/dev/android/android-sdk-macosx/tools"
export PATH="$PATH:~/dev/android/android-sdk-macosx/platform-tools"

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
