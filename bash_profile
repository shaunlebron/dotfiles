export PATH=~/bin:$PATH

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias audacity='/Applications/Audacity.app/Contents/MacOS/Audacity'

# installed from `brew install coreutils`
alias ls='gls --color --group-directories-first'
alias grep='grep --color=auto'

BREW=`brew --prefix`

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# taken from cygwin's default PS1
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]$(parse_git_branch)\n\$ '

export EDITOR="vim"
export VISUAL="vim"
set -o vi

shopt -s extglob  # extended glob
#shopt -s globstar  # so we can use **/*.ext for recursive search
shopt -s lithist  # literal history (keep newlines)

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="~/.vim/plugged/vim-iced/bin:$PATH"
