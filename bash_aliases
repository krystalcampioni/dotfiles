# git
alias gb="git branch -a"
alias gc="git commit -a"
alias gd="git diff | mate"
alias gl="git pull"
alias gp="git push"
alias gta="git status"
alias gr="git reset --hard"
alias ga="git add ."
alias gm="git checkout master"

# rails 
alias c='rails c'
alias s='rails s'
alias int='rake integrate'
alias migrate='rake db:migrate && rake db:test:clone'
alias redo='rake db:migrate:redo && rake db:test:clone'
alias back='rake db:rollback && rake db:test:clone'

# ruby

# Borrowed from Mislav (http://github.com/mislav/dotfiles/tree/master/bash_aliases)
# really awesome function, use: cdgem <gem name>, cd's into your gems directory
# and opens gem that best matches the gem name provided
function cdgem {
  cd `gem env gemdir`/gems
  cd `ls | grep $1 | sort | tail -1`
}
function mategem {
  gemdir=$(gem env gemdir)/gems
  name=$(ls $gemdir | /usr/bin/ruby -rubygems -r rubygems/version -e 'gem = STDIN.lines.
      map {|l| l =~ /-([^-]+)\s*$/; [$`, Gem::Version.new($1)] if $` == ARGV.first }.
      compact.sort_by(&:last).last
    print gem.join("-") if gem
    ' $1)

  if [ -z "$name" ]; then
    echo "gem not found" 1>&2
  else
    $EDITOR $gemdir/$name
  fi
}