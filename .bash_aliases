alias sbrc='source ~/.bashrc'
alias genpw='pwgen -s -n -B 24'

alias ..='cd ..'

alias go-run='go run !(*_test).go'

alias brew-up='brew update --all && brew upgrade && brew cleanup'

alias remove-all-gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

alias xcode6='/Applications/Xcode.app/Contents/MacOS/Xcode </dev/null &>/dev/null &'

# virtualbox
alias vb-restart='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'

# middleman
alias start-mm='bundle exec middleman server --port $PORT'

alias edit-hosts='$EDITOR /etc/hosts'
alias edit-dots='$EDITOR ~/.dotfiles'

alias run='forego start'
alias run-dev='forego start -f Procfile.dev'

alias git='hub'

alias rails-log='tail -f log/development.log'

alias npm-exec='PATH=$(npm bin):$PATH'

function git-hotfix () {
  if [ -z "$1" ]; then
    branch="master"
  else
    branch=$1
  fi
  git pull-request -m "Hotfix Release" -b $branch
}

function git-release () {
  if [ -z "$1" ]; then
    branch="master"
  else
    branch=$1
  fi
  git pull-request -m "New Release" -b $branch
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
  git pull-request -m "$1" -b $branch
}

# js2coffee shorthand
function j2c () {
  if [ -z "$1" ]; then
    echo "please provide a filepath"
    return
  fi
  newfile=${1%".js"}
  js2coffee $1 > $newfile.coffee
}

function vmware () {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "please give vm name and action {start|stop}"
    return
  fi
  vmrun $2 ~/Documents/Virtual-Machines.localized/$1.vmwarevm/$1.vmx nogui
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

alias rmf='rm -rf'

# rails
alias rails-env-dev='RAILS_ENV=development'
alias rails-env-test='RAILS_ENV=test'
alias rails-env-prod='RAILS_ENV=production'
alias db-recreate="rake db:drop db:create db:migrate"

# nginx
alias nginx-reload='sudo nginx -s reload'

# other
alias coffee-watch='coffee --watch --output js/ coffee/'

# Local alias definitions.
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
