# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

alias tmux-kill-all="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#!/bin/bash
alias sbrc='source ~/.bashrc'
alias genpw='pwgen -s -n -B 24'

alias ..='cd ..'

alias go-run='go run !(*_test).go'

alias update='sudo apt-get update && sudo apt-get upgrade'

alias remove-all-gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

# middleman
alias start-mm='bundle exec middleman server --port $PORT'

# docker
alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-clean-c='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias docker-clean-i='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
alias docker-clean-all-i='docker rmi $(docker images -q)'
alias docker-clean-all='docker-clean || true && docker-clean-all-i && docker volume prune -f'
alias docker-clean='docker-clean-c || true && docker-clean-i'

alias edit-hosts='$EDITOR /etc/hosts'
alias edit-dots='$EDITOR ~/.dotfiles'

alias run='bundle exec foreman start'
alias run-dev='bundle exec foreman start -f Procfile.dev'

alias rails-log='tail -f log/development.log'

alias check-port='sudo lsof -i :'

alias be='bundle exec'

alias utube-audio='youtube-dl -x --audio-format mp3'
alias utube='youtube-dl -f mp4'

alias aws-login='eval $(aws ecr get-login)'
function s3-sync () {
  if [ -z "$1" ]; then
    echo "Specify a bucket path like 'bucker/folder/file or just the bucket name to sync all files'"
  else
    aws s3 sync "s3://$1" .
  fi
}

alias gen-ssh='ssh-keygen -t ed25519'

function encrypt () {
  if [ -z "$1" ]; then
    echo "Specify a file to encrypt"
  else
    openssl aes-256-cbc -e -md sha256 -a -salt -in "$1" -out "$1.enc"
  fi
}

function decrypt () {
  if [ -z "$1" ]; then
    echo "Specify a file to decrypt"
  else
    openssl aes-256-cbc -d -md sha256 -a -in "$1.enc" -out "$1"
  fi
}

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# tar
alias packgz='tar zcvf'
alias unpackgz='tar zxvf'

# cds
function cl () {
   if [ $# = 0 ]; then
      cd && ls -la
   else
      cd "$*" && ls -la
   fi
}

alias l='ls -lah'

alias e='$EDITOR .'

alias ansible-vagrant='ansible-playbook -i hosts playbook.yml --private-key=~/.vagrant.d/insecure_private_key -u vagrant'

alias vault-decrypt='ansible-vault decrypt secrets.yml'
alias vault-encrypt='ansible-vault encrypt secrets.yml'

alias rmf='rm -rf'

# jass en/decryption
function jass-decrypt () {
  echo "${1}" | jass -d -k "$MAIN_SSH_KEY_PATH"
}

# Local alias definitions.
# shellcheck source=/dev/null
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
