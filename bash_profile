export PATH=~/bin:$PATH

# installed from `brew install coreutils`
alias ls='gls --color --group-directories-first'

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

# Using this to generate hashes for UID-CSS
# from: https://twitter.com/kenitter/status/2917714802
hash ()
{
  for i in $(seq 1 5); do
    echo -n $(echo "obase=16; $(($RANDOM % 16))" | bc );
  done | tr '[:upper:]' '[:lower:]'
  echo
}
