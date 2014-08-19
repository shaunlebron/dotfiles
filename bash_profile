export PATH=~/bin:$PATH

# installed from `brew install coreutils`
alias ls='gls --color --group-directories-first'
alias grep='grep --color=auto'

BREW=`brew --prefix`
alias vim="$BREW/bin/vim"
alias ctags="$BREW/bin/ctags"

# taken from cygwin's default PS1
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

export EDITOR="vim"
export VISUAL="vim"
set -o vi

shopt -s extglob  # extended glob
shopt -s lithist  # literal history (keep newlines)
