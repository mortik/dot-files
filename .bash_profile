export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH=/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
export PATH=/opt/X11/bin:/usr/local/git/bin:/Users/mortik/Applications/bin:$PATH
export VM_PATH=/Users/mortik/Documents/Virtual-Machines.localized

if [ -f $(brew --prefix)/var/rbenv ]; then
  export RBENV_ROOT=$(brew --prefix)/var/rbenv
  eval "$(rbenv init -)"
fi

case $- in
   *i*) source ~/.bashrc
esac
export PATH=~/pebble-dev/PebbleSDK-3.0-dp1/bin:$PATH
export PATH=~/pebble-dev/PebbleSDK-3.0-dp1/bin:$PATH
