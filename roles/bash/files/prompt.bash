#!/bin/bash

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
PINK="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
ORANGE="\[\033[1;31m\]"
DARK_GRAY="\[\033[1;30m\]"
WHITE="\[\033[0;37m\]"
LIGHT_GRAY="\[\033[0;38m\]"
COLOR_NONE="\[\e[0m\]"

export GIT_RADAR_FETCH_TIME=30

function set_prompt_symbol () {
  if test "$1" -eq 0 ; then
      PROMPT_SYMBOL="${PINK}❯${COLOR_NONE}"
  else
      PROMPT_SYMBOL="${RED}❯${COLOR_NONE}"
  fi
}

function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      VIRTUAL_ENV=$(basename "$VIRTUAL_ENV")
      PYTHON_VIRTUALENV=" ${BLUE}[$VIRTUAL_ENV]${COLOR_NONE}"
  fi
}

function set_ruby_version () {
  if [ -f .ruby-version ]; then
    ruby_version="$(ruby -v)"
    version_pattern="^ruby ([0-9\.p]+)"
    if [[ ${ruby_version} =~ ${version_pattern} ]]; then
      RUBY_VERSION=" ${CYAN}<${BASH_REMATCH[1]}>${COLOR_NONE}"
    else
      RUBY_VERSION=""
    fi
  else
    RUBY_VERSION=""
  fi
}

function set_user_prompt () {
  if [ "$(id -u)" == '0' ]; then
    color="${RED}"
  else
    color="${PINK}"
  fi
  USER_PROMPT="${color}\u${COLOR_NONE} at "
}

function set_machine_prompt () {
  MACHINE_PROMPT="${RED}\h${COLOR_NONE} "
}

function set_bash_prompt () {
  set_prompt_symbol $?

  set_virtualenv

  set_ruby_version

  set_user_prompt

  set_machine_prompt

  PS1="\n${CYAN}\t${COLOR_NONE} ${USER_PROMPT}${MACHINE_PROMPT}\w${PYTHON_VIRTUALENV}${RUBY_VERSION}\$(git-radar --bash)\n${PROMPT_SYMBOL} "
}

PROMPT_COMMAND=set_bash_prompt
