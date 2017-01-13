export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[ -e $(brew --prefix)/etc/bash_completion ] && source  $(brew --prefix)/etc/bash_completion

export PATH=/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH

case $- in
   *i*) source $HOME/.bashrc
esac

# The next line updates PATH for the Google Cloud SDK.
[ -e $HOME/google-cloud-sdk/path.bash.inc ] && source "$HOME/google-cloud-sdk/path.bash.inc"

# The next line enables shell command completion for gcloud.
[ -e $HOME/google-cloud-sdk/completion.bash.inc ] && source "$HOME/google-cloud-sdk/completion.bash.inc"
