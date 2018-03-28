#!/bin/bash

[[ $- != *i* ]] && return

export CDPATH={{ bash_cdpath }}

# append to the history file, don't overwrite it
shopt -s histappend

# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor
export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}

# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s checkwinsize

shopt -s expand_aliases

# Modify PATH
export PATH=./node_modules/.bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=./bin:$PATH

# Set editor
export EDITOR={{ editor }}

# shellcheck source=/dev/null
for config in $HOME/.bashrc.d/*.bash ; do
  [ -e "$config" ] && source $config
done

# shellcheck source=/dev/null
for config in $HOME/.bashrc.d/aliases/*.bash ; do
  [ -e "$config" ] && source $config
done
