alias sbrc='source ~/.bashrc'
alias genpw='pwgen -s -n -B 24'

alias go-run='go run !(*_test).go'

alias brew-up='brew update && brew upgrade && brew cleanup'

alias remove-all-gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

# virtualbox
alias vb-restart='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'

#middleman
alias start-mm='bundle exec middleman server --port $PORT'

alias npm-exec='PATH=$(npm bin):$PATH'

# github
function gh-clone () {
  if [ -z "$1" || -z "$2" ]; then
    return
  fi
  git clone git@github.com:$1/$2.git
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
if [ -f ~/.local_aliases ]; then
    . ~/.local_aliases
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
