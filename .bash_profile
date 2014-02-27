if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

PATH="/usr/local/bin:/usr/local/sbin:$PATH"

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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"
export PATH=/Users/mortik/.rbenv/shims:/Users/mortik/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/Users/mortik/Applications/bin:/Users/mortik/.traq
export TRAQ_PATH=/Users/mortik/.traq
export TRAQ_DATA_DIR=/Users/mortik/Library/traq
export VM_PATH=/Users/mortik/Documents/Virtual-Machines.localized
