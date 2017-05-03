#!/bin/bash

if [ -e "$(brew --prefix)/bin/rbenv" ]; then
  export RBENV_ROOT
  RBENV_ROOT=$(brew --prefix)/var/rbenv
  eval "$(rbenv init -)"
fi
