" == Styling and Themes ==
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rose-pine/neovim'

" == Snippets ==
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" == Autocomplete plugins ==
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'

" == File Search ==
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" == Syntax Highlighting ==
Plug 'sheerun/vim-polyglot' " == replace all specific highlights

" == General editor plugins ==
Plug 'scrooloose/nerdcommenter' " == comment helpers
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround' " == helpers with surrounders
Plug 'tpope/vim-repeat' " == improve repeat using .
Plug 'jiangmiao/auto-pairs' " == auto close pairs
Plug 'airblade/vim-gitgutter' " == git visually helpers
Plug 'Yggdroot/indentLine' " == indent guides visually
Plug 'wakatime/vim-wakatime' " === wakatime plugin
Plug 'tpope/vim-fugitive' " == git commands
Plug 'qstrahl/vim-matchmaker' " == highlight words under cursor
Plug 'shime/vim-livedown' " == markdown live preview
Plug 'editorconfig/editorconfig-vim' " == editor config for vim
Plug 'kristijanhusak/vim-carbon-now-sh'

" === NEOVIM 0.5 ===
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'phaazon/hop.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
