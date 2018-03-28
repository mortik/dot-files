#!/bin/bash

if [ -e "$HOME/.rbenv" ]; then
  export RBENV_ROOT
  RBENV_ROOT=$HOME/.rbenv
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi
