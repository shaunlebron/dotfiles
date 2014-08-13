"==================================================================================
" VUNDLE (auto-install plugins):
" > git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" > vim +BundleInstall
"==================================================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'majutsushi/tagbar'
"Bundle 'jpalardy/vim-slime'
Bundle 'tpope/vim-fugitive'
Bundle 'groenewege/vim-less'
Bundle 'godlygeek/tabular'
Bundle 'alfredodeza/jacinto.vim'
Bundle 'flazz/vim-colorschemes'
"Bundle 'mxw/vim-jsx'
Bundle 'guns/vim-clojure-static'

"==================================================================================
" PLUGINS
"==================================================================================
let g:slime_target = "tmux"         " set slime to use tmux
map <C-n> :NERDTreeTabsToggle<CR>
                                    " C-n to toggle file browser

if has("gui_macvim")
    " colorscheme bclear
    " colorscheme railscasts
    colorscheme underwater
    " colorscheme Monokai
endif

" custom clojure highlighting for library macros
let g:clojure_syntax_keywords = {
    \  'clojureDefine': ["defcomponent"]
    \, 'clojureMacro': ["display-name","init-state","should-update","will-mount","did-mount","will-unmount","will-update","did-update","will-receive-props","render","render-state"]
    \ }

" Default special indent words (every sub-form indented two spaces)
let g:clojure_special_indent_words = 'defcomponent,deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'

"==================================================================================
" GENERAL
"==================================================================================

set vb                              " set visual bell (instead of auditory bell)
set backspace=indent,eol,start      " make backspace work in insert mode

syntax on                           " use default syntax highlighting colors
set autoindent                      " simple indent (follows preceding line)
filetype plugin indent on           " filetype[ON] plugin[ON] indent[ON]
set number                          " number lines

set nofoldenable

set hlsearch                        " highlight text that matches search
set incsearch                       " incrementally highlight results as search is typed

set expandtab                       " expand tabs to spaces when inserting
set tabstop=2                       " number of spaces a tab counts for
set softtabstop=2                   " something about a mix of tabs and spaces? idk
set shiftwidth=2                    " number of spaces to shift when using '<<' or '>>'

set cursorline                      " highlight current line

set modeline                        " enable modeline (reading comment line in file for file-specific vim settings)
set modelines=2                     " look for modeline in last two lines of file

set nowrap

autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
autocmd BufNewFile,BufRead *.md set filetype=markdown

"==================================================================================
" Tagbar languages
"==================================================================================

let g:tagbar_type_clojure = {
  \ 'ctagstype' : 'clojure',
  \ 'kinds' : [
    \ 'n:namespace',
    \ 'z:atom',
    \ 'd:definition',
    \ 'f:function',
    \ 'm:macro',
    \ 'i:inline',
    \ 'a:multimethod definition',
    \ 'b:multimethod instance',
    \ 'c:definition (once)',
    \ 's:struct',
    \ 'v:intern',
    \ 'h:hiccup template'
  \ ]
\ }

"==================================================================================
" Project-specific settings
"==================================================================================

" autocmd BufNewFile,BufRead /Users/swilliam/code/Shipmates/Assets/Scripts/* set tabstop=4 shiftwidth=4 softtabstop=4
