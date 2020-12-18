#!/bin/bash
alias sbrc='source ~/.bashrc'
alias genpw='pwgen -s -n -B 24'

alias ..='cd ..'

alias go-run='go run !(*_test).go'

alias update='brew update --preinstall && brew upgrade && brew cleanup'

alias remove-all-gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

# middleman
alias start-mm='bundle exec middleman server --port $PORT'

# git
alias git-cleanup-branches="git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -d"
alias git-cleanup-branches-force="git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -D"

# docker
alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-clean-c='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias docker-clean-i='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
alias docker-clean-all-i='docker rmi $(docker images -q)'
alias docker-clean-all='docker-clean || true && docker-clean-all-i && docker volume prune -f'
alias docker-clean='docker-clean-c || true && docker-clean-i'

alias edit-hosts='$EDITOR /etc/hosts'
alias edit-dots='$EDITOR ~/.dotfiles'

alias run='forego start'
alias run-dev='forego start -f Procfile.dev'
alias run-dummy='pushd test/dummy && run-dev && popd'

alias check-port='sudo lsof -i :'

alias be='bundle exec'

alias tmux-kill-all="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

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

alias set-hostname='sudo scutil --set HostName'

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

function kube-shell () {
  if [ -z "$1" ]; then
    echo "Specify a pod name'"
  else
    kubectl exec --stdin --tty $1 -- /bin/bash
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

# jass en/decryption
function jass-decrypt () {
  echo "${1}" | jass -d -k "$MAIN_SSH_KEY_PATH"
}

# Local alias definitions.
# shellcheck source=/dev/null
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
