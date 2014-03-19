syntax on
set autoindent
filetype plugin indent on
set nu

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set cursorline

" Treat hyphen "-" as a word symbol when using clojure
au BufNewFile,BufRead *.clj,*.cljs set lisp
