set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" core
Plug 'kien/ctrlp.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'jistr/vim-nerdtree-tabs'
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
Plug 'tikhomirov/vim-glsl'

" clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'eraserhd/parinfer-rust'

" colors
Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'

" fullscreen typography
Plug 'junegunn/goyo.vim'

Plug 'tpope/vim-fugitive'

call plug#end()

"==================================================================================
" PLUGINS
"==================================================================================

" C-n to toggle file browser
"map <C-n> :NERDTreeTabsToggle<CR>

" fuzzy search tags
nnoremap <C-t> :CtrlPTag<CR>
nnoremap <C-[> :pop<CR>

" after running Ggrep, open results in a quickfix window
autocmd QuickFixCmdPost *grep* cwindow
map <C-j> :cn<CR>
map <C-k> :cp<CR>

"==================================================================================
" GUI
"==================================================================================

func! ChangeBackground()
  let mode = systemlist("defaults read -g AppleInterfaceStyle")[0]
  if mode ==? "dark"
    set background=dark
    colorscheme onedark
  else 
    set background=light
    colorscheme bclear
  endif
  "redraw!
endfunc


if has("gui_vimr")
  call ChangeBackground()
elseif has("gui_macvim")
  au OSAppearanceChanged * call ChangeBackground()
endif

map <silent> <C-L> :call ChangeBackground()<CR>

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
set ruler                           " show line and col

set nofoldenable

set hlsearch                        " highlight text that matches search
set incsearch                       " incrementally highlight results as search is typed

set expandtab                       " expand tabs to spaces when inserting
set tabstop=2                       " number of spaces a tab counts for
set softtabstop=2                   " something about a mix of tabs and spaces? idk
set shiftwidth=2                    " number of spaces to shift when using '<<' or '>>'

set nocursorline                      " highlight current line

set modeline                        " enable modeline (reading comment line in file for file-specific vim settings)
set modelines=2                     " look for modeline in last two lines of file

set nowrap
autocmd BufNewFile,BufRead *.tex set wrap | set textwidth=80

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

" use GNU make
set makeprg=gmake

"==================================================================================
" Project-specific settings
"==================================================================================

" autocmd BufNewFile,BufRead /Users/swilliam/code/Shipmates/Assets/Scripts/* set tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead /Users/swilliam/code/matrixops/h2o/* ParinferOff




set encoding=utf-8
