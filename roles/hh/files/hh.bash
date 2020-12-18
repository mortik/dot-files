#!/bin/bash

# append to the history file, don't overwrite it
shopt -s histappend

# add this configuration to ~/.bashrc
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)

export HH_CONFIG=hicolor         # get more colors

if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
