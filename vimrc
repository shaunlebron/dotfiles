execute pathogen#infect()
let g:slime_target = "tmux"         " set slime to use tmux

set backspace=indent,eol,start

syntax on                           " use default syntax highlighting colors
set autoindent                      " simple indent (follows preceding line)
filetype plugin indent on           " filetype[ON] plugin[ON] indent[ON]
set number                          " number lines

set hlsearch                        " highlight text that matches search
set incsearch                       " incrementally highlight results as search is typed

set expandtab                       " expand tabs to spaces when inserting
set tabstop=2                       " number of spaces a tab counts for
set softtabstop=2                   " something about a mix of tabs and spaces? idk
set shiftwidth=2                    " number of spaces to shift when using '<<' or '>>'

set cursorline                      " highlight current line

set modeline                        " enable modeline (reading comment line in file for file-specific vim settings)
set modelines=2                     " look for modeline in last two lines of file
