export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi

if [ -f /usr/local/etc/bash_completion.d/git-flow-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-flow-completion.bash
fi

export PATH=/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
export PATH=/opt/X11/bin:/usr/local/git/bin:/Users/mortik/Applications/bin:$PATH
export TRAQ_PATH=/Users/mortik/.traq
export TRAQ_DATA_DIR=/Users/mortik/Library/traq
export VM_PATH=/Users/mortik/Documents/Virtual-Machines.localized

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
