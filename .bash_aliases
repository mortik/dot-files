#!/bin/bash
alias sbrc='source ~/.bashrc'
alias genpw='pwgen -s -n -B 24'

alias ..='cd ..'

alias go-run='go run !(*_test).go'

alias update='brew update --all && brew upgrade && brew cleanup'

alias remove-all-gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

alias xcode6='/Applications/Xcode.app/Contents/MacOS/Xcode </dev/null &>/dev/null &'

# virtualbox
alias vb-restart='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'

# middleman
alias start-mm='bundle exec middleman server --port $PORT'

# docker
alias docker-eval='docker-machine start default && eval $(docker-machine env)'

alias edit-hosts='$EDITOR /etc/hosts'
alias edit-dots='$EDITOR ~/.dotfiles'

alias run='forego start'
alias run-dev='forego start -f Procfile.dev'

alias git='hub'

alias rails-log='tail -f log/development.log'

alias check-port='sudo lsof -i :'

alias pg-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pg-stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

alias redis-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
alias redis-stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'

alias couch-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.couchdb.plist'
alias couch-stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.couchdb.plist'

alias influx-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.influxdb.plist'
alias influx-stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.influxdb.plist'

alias chrono-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.chronograf.plist'
alias chrono-stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.chronograf.plist'

alias local-services-stop='pg-stop && redis-stop && couch-stop && influx-stop && chrono-stop'
alias local-services-start='pg-start && redis-start && couch-start && influx-start && chrono-start'

alias npm-exec='PATH=$(npm bin):$PATH'

alias mocha-run='NODE_ENV=test mocha --harmony --recursive'
alias mocha-run-1='NODE_ENV=test mocha --harmony test/test-helper.js'

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
    openssl aes-256-cbc -a -salt -in "$1" -out "$1.enc"
  fi
}

function decrypt () {
  if [ -z "$1" ]; then
    echo "Specify a file to decrypt"
  else
    openssl aes-256-cbc -d -a -in "$1.enc" -out "$1"
  fi
}

function git-hotfix () {
  if [ -z "$1" ]; then
    branch="master"
  else
    branch=$1
  fi
  git pull-request -m "Hotfix Release" -b "$branch"
}

function git-release () {
  if [ -z "$1" ]; then
    branch="master"
  else
    branch=$1
  fi
  git pull-request -m "New Release" -b "$branch"
}

function git-pr () {
  if [ -z "$1" ]; then
    echo "Please provide a Pull Request Message"
    return
  fi
  if [ -z "$2" ]; then
    branch="develop"
  else
    branch=$2
  fi
  git pull-request -m "$1" -b "$branch"
}

# js2coffee shorthand
function j2c () {
  if [ -z "$1" ]; then
    echo "please provide a filepath"
    return
  fi
  newfile=${1%".js"}
  js2coffee "$1" > "$newfile.coffee"
}

function vmware () {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "please give vm name and action {start|stop}"
    return
  fi
  vmrun "$2" "$HOME/Documents/Virtual-Machines.localized/$1.vmwarevm/$1.vmx" nogui
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

alias apm-export='apm list --installed --bare > packages.txt'

alias ansible-vagrant='ansible-playbook -i hosts playbook.yml --private-key=~/.vagrant.d/insecure_private_key -u vagrant'

alias vault-decrypt='ansible-vault decrypt secrets.yml'
alias vault-encrypt='ansible-vault encrypt secrets.yml'

alias rmf='rm -rf'

# rails
alias rails-env-dev='RAILS_ENV=development'
alias rails-env-test='RAILS_ENV=test'
alias rails-env-prod='RAILS_ENV=production'
alias db-recreate="rake db:drop db:create db:migrate"

# nginx
alias nginx-reload='sudo nginx -s reload'

# jass en/decryption
function jass-decrypt () {
  echo "${1}" | jass -d -k "$MAIN_SSH_KEY_PATH"
}

# other
alias coffee-watch='coffee --watch --output js/ coffee/'

# Local alias definitions.
# shellcheck source=/dev/null
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

# project iterm function definitions.
# shellcheck source=/dev/null
if [ -f ~/.dotfiles/.bash_tabs_one ]; then
    . ~/.dotfiles/.bash_tabs_one
fi
# shellcheck source=/dev/null
if [ -f ~/.dotfiles/.bash_tabs_reckoning ]; then
    . ~/.dotfiles/.bash_tabs_reckoning
fi
# shellcheck source=/dev/null
if [ -f ~/.dotfiles/.bash_tabs_woa ]; then
    . ~/.dotfiles/.bash_tabs_woa
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
