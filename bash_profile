export PATH=~/bin:$PATH

# installed from `brew install coreutils`
alias ls='gls --color --group-directories-first'

# installed from `brew install vim`
alias vim="/usr/local/bin/vim"

# taken from cygwin's default PS1
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

export EDITOR="vim"
export VISUAL="vim"
set -o vi
