"Plugins>>
call plug#begin()

Plug 'jaawerth/neomake-local-eslint-first'
Plug 'neomake/neomake'
Plug 'wakatime/vim-wakatime'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ervandew/supertab'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'rizzatti/dash.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'

call plug#end()
"<<Plugins

colorscheme jellybeans

let mapleader=","

set showcmd                  " Show (partial) command in status line.
set showmatch                " Show matching brackets.
set showmode                 " Show current mode.
set ruler                    " Show the line and column numbers of the cursor.
set number                   " Show the line numbers on the left side.
set formatoptions+=o         " Continue comment marker in new lines.
set textwidth=0              " Hard-wrap long lines as you type them.
set expandtab                " Insert spaces when TAB is pressed.
set tabstop=2                " Render TABs using this many spaces.
set shiftwidth=2             " Indentation amount for < and > commands.
set noerrorbells             " No beeps.
set modeline                 " Enable modeline.
set esckeys                  " Cursor keys in insert mode.
set linespace=0              " Set line-spacing to minimum.
set nojoinspaces             " Prevents inserting two spaces after punctuation on a join (J)
set splitbelow               " Horizontal split below current.
set splitright               " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3            " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5        " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline            " Do not jump to first character with page commands.

"Airline>>
let g:airline_theme='bubblegum'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10
"<<Airline

"Neomake>>
"let g:neomake_open_list = 2

let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

autocmd! BufWritePost * Neomake
"<<Neomake

"NerdTree>>
map <C-n> :NERDTreeToggle<CR>
"<<NerdTree

"SnipMate>>
:imap jj <Plug>snipMateNextOrTrigger
:smap jj <Plug>snipMateNextOrTrigger
"<<SnipMate
