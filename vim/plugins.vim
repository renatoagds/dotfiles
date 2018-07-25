" == Styling and Themes ==
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'crusoexia/vim-monokai'
Plug 'jacoborus/tender.vim'

" == Snippets ==
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'garbas/vim-snipmate'

" == Autocomplete plugins ==
Plug 'ternjs/tern_for_vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-jedi'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'mattn/emmet-vim'
Plug 'othree/jspc.vim'
Plug 'mhartington/nvim-typescript'
" Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --tern-completer' }

" == Syntax Highlighting ==
Plug 'sheerun/vim-polyglot' " == replace all specific highlights
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/jsdoc-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
Plug 'flowtype/vim-flow'
Plug 'hail2u/vim-css3-syntax'
" Plug 'isRuslan/vim-es6'
" Plug 'Quramy/vim-js-pretty-template'
" Plug 'elzr/vim-json'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'chemzqm/vim-jsx-improve'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-liquid'

" == Tools Integration ==
Plug 'w0rp/ale'
" Plug 'neomake/neomake'

" == File Search ==
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'

" == NodeJS ==
Plug 'moll/vim-node'

" == Android ==
Plug 'hsanson/vim-android'

" == General editor plugins ==
Plug 'tpope/vim-surround' " == helpers with surrounders
Plug 'scrooloose/nerdtree' " == file tree
Plug 'tpope/vim-repeat' " == improve repeat using .
Plug 'jiangmiao/auto-pairs' " == auto close pairs
Plug 'airblade/vim-gitgutter' " == git visually helpers
Plug 'Yggdroot/indentLine' " == indent guides visually
Plug 'wakatime/vim-wakatime' " === wakatime plugin
Plug 'tomtom/tlib_vim'  " == utility functions
Plug 'MarcWeber/vim-addon-mw-utils' " == cache files
Plug 'tpope/vim-fugitive' " == git commands
Plug 'scrooloose/nerdcommenter' " == comment helpers
Plug 'Xuyuanp/nerdtree-git-plugin' " == git for nerd tree
Plug 'rizzatti/dash.vim' " == plugin for Dash (MacOnly)
Plug 'easymotion/vim-easymotion' " == improve movimentation in file
Plug 'qstrahl/vim-matchmaker' " == highlight words
Plug 'Valloric/ListToggle' " == toogle list
Plug 'sbdchd/neoformat' " == format code
Plug 'kristijanhusak/vim-carbon-now-sh' " == take screenshot of your code
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' } " == markdown live preview
" Plug 'nathanaelkane/vim-indent-guides' " == indent guides visually
" Plug 'ludovicchabant/vim-gutentags' " == ctags handler
