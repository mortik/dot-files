if [ -e "$(brew --prefix)/bin/rbenv" ]; then
  export RBENV_ROOT
  RBENV_ROOT=$(brew --prefix)/var/rbenv
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi
