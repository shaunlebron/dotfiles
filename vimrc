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

"==================================================================================
" GUI
"==================================================================================

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


func! ChangeBackground()
  let s:mode = systemlist("defaults read -g AppleInterfaceStyle")[0]
  if s:mode ==? "dark"
    set background=dark
    colorscheme onedark
  else 
    set background=light
    colorscheme bclear
  endif
  redraw!
endfunc


call ChangeBackground()
if has("gui_macvim")
  au OSAppearanceChanged * call ChangeBackground()
endif

map <C-L> :call ChangeBackground()<CR>

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
