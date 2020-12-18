#!/bin/bash

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH

# shellcheck source=/dev/null
case $- in
   *i*) source "$HOME/.bashrc"
esac

# shellcheck source=/dev/null
# The next line updates PATH for the Google Cloud SDK.
[ -e "$HOME/google-cloud-sdk/path.bash.inc" ] && source "$HOME/google-cloud-sdk/path.bash.inc"

# shellcheck source=/dev/null
# The next line enables shell command completion for gcloud.
[ -e "$HOME/google-cloud-sdk/completion.bash.inc" ] && source "$HOME/google-cloud-sdk/completion.bash.inc"
