export PATH=~/bin:$PATH

# installed from `brew install coreutils`
alias ls='gls --color --group-directories-first'
alias grep='grep --color=auto'

BREW=`brew --prefix`
alias vim="$BREW/bin/vim"
alias ctags="$BREW/bin/ctags"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# taken from cygwin's default PS1
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]$(parse_git_branch)\n\$ '

export EDITOR="vim"
export VISUAL="vim"
set -o vi

shopt -s extglob  # extended glob
shopt -s lithist  # literal history (keep newlines)
