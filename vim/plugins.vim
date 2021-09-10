" == Styling and Themes ==
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }

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
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' } " == markdown live preview
Plug 'editorconfig/editorconfig-vim' " == editor config for vim

" === NEOVIM 0.5 ===
Plug 'wfxr/minimap.vim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'phaazon/hop.nvim'
