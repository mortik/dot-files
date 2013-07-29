# pwgen
alias genpw='pwgen -s -n -B 24'

# git
alias gs='git s'
alias gp='git pull'
alias gpu='git push'
alias gl='git lg'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcob='git checkout -b'
alias ga='git add -i'
alias gap='git add -p'
alias gitrm='git ls-files --deleted | xargs git rm'


alias remove-all-gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

# rails
alias start-app='be foreman start'

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

# bundler
alias bu='bundle update'
alias bi='bundle install'
alias be='bundle exec'
alias br='bundle exec rake'
alias bt='bundle exec thor'

# nginx
alias nginx-reload='nginx -s reload'

# mysql
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias mysql-start='sudo /usr/local/mysql/bin/mysqld_safe'
alias mysql-stop='sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop'

# other
alias coffee-watch='coffee --watch --output js/ coffee/'

# Local alias definitions.
if [ -f ~/.local_aliases ]; then
    . ~/.local_aliases
fi
