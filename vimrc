"==================================================================================
" VUNDLE (auto-install plugins):
" > git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" > vim +BundleInstall
"==================================================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-fugitive'
Plugin 'groenewege/vim-less'
Plugin 'godlygeek/tabular'
Plugin 'alfredodeza/jacinto.vim'
Plugin 'flazz/vim-colorschemes'
"Plugin 'mxw/vim-jsx'
Plugin 'guns/vim-clojure-static'
Plugin 'airblade/vim-gitgutter'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-scripts/paredit.vim'
Plugin 'sukima/asciidoc-vim'
Plugin 'tpope/vim-liquid'
call vundle#end()

filetype plugin indent on           " filetype[ON] plugin[ON] indent[ON]

"==================================================================================
" PLUGINS
"==================================================================================

" allows us to use % inside an xml tag to go to its counterpart tag
runtime macros/matchit.vim

let g:slime_target = "tmux"         " set slime to use tmux
map <C-n> :NERDTreeTabsToggle<CR>
                                    " C-n to toggle file browser

let g:vim_json_syntax_conceal = 0

if has("gui_macvim")
    " colorscheme bclear
    " colorscheme railscasts
    colorscheme underwater
    set guifont=Menlo\ Regular:h14
    " colorscheme Monokai
elseif &t_Co == 256
    " color support seems to be very difficult in terminals (giving up here)
    " colorscheme underwater
endif

" custom clojure highlighting for library macros
let g:clojure_syntax_keywords = {
    \  'clojureDefine': ["defcomponent"]
    \, 'clojureFunc': ["<!",">!","put!","take!","alts!","alt!","close!","chan","timeout"]
    \, 'clojureMacro': ["display-name","init-state","should-update","will-mount","did-mount","will-unmount","will-update","did-update","will-receive-props","render","render-state"
    \,                  "go","go-loop"
    \,                  "match"]
    \ }

" Default special indent words (every sub-form indented two spaces)
" (plus defcomponent)
let g:clojure_special_indent_words = 'defcomponent,deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,match'

" Default special indent patterns (every sub-form indented two spaces)
" (plus go and go-loop)
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^go']

"==================================================================================
" GENERAL
"==================================================================================

set vb                              " set visual bell (instead of auditory bell)
set backspace=indent,eol,start      " make backspace work in insert mode

syntax on                           " use default syntax highlighting colors
set autoindent                      " simple indent (follows preceding line)
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

autocmd BufNewFile,BufReadPost *.cljx,*.cljc setfiletype clojure
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.cljsdoc set filetype=
autocmd BufNewFile,BufRead *.adoc set filetype=asciidoc

" git gutter settings
highlight clear SignColumn

" highlight matching paren
hi MatchParen guibg=#000000

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
