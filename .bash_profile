export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH=/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH

case $- in
   *i*) source ~/.bashrc
esac
