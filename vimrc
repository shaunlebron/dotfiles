set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" core
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" other langs
Plug 'hail2u/vim-css3-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'guns/vim-clojure-static'

" colors
Plug 'flazz/vim-colorschemes'

" fullscreen typography
Plug 'junegunn/goyo.vim'

call plug#end()

"==================================================================================
" PLUGINS
"==================================================================================

" C-n to toggle file browser
map <C-n> :NERDTreeTabsToggle<CR>

"==================================================================================
" GUI
"==================================================================================

if has("gui_macvim")
    " colorscheme bclear
    " colorscheme railscasts
    colorscheme underwater
    set guifont=Menlo\ Regular:h14
    " colorscheme Monokai
elseif has("gui_vimr")
    colorscheme underwater

    " Set the working directory to the first buffer opened
    au BufEnter * :cd %:p:h 
elseif &t_Co == 256
    " color support seems to be very difficult in terminals (giving up here)
    " colorscheme underwater
endif

"==================================================================================
" Mouse
"==================================================================================

set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
end


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

autocmd BufNewFile,BufReadPost *.cljx,*.cljc,*.boot setfiletype clojure
autocmd BufNewFile,BufReadPost *.cson setfiletype coffee
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.cljsdoc set filetype=
autocmd BufNewFile,BufRead *.adoc set filetype=asciidoc

" git gutter settings
highlight clear SignColumn

" highlight matching paren
hi MatchParen guibg=#000000

" markdown codeblock langs
let g:vim_markdown_fenced_languages = ['js=javascript', 'clj=clojure']

" make prettier plugin use prettier's defaults
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'

" dont hide json key quotes
let g:vim_json_syntax_conceal = 0

"==================================================================================
" Project-specific settings
"==================================================================================

" autocmd BufNewFile,BufRead /Users/swilliam/code/Shipmates/Assets/Scripts/* set tabstop=4 shiftwidth=4 softtabstop=4
