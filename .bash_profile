export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH=/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
export PATH=/opt/X11/bin:/usr/local/git/bin:/Users/mortik/Applications/bin:$PATH
export TRAQ_PATH=/Users/mortik/.traq
export TRAQ_DATA_DIR=/Users/mortik/Library/traq
export VM_PATH=/Users/mortik/Documents/Virtual-Machines.localized

export RBENV_ROOT=$(brew --prefix)/var/rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
