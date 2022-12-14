return require('packer').startup(function(use)
	-- styling and themes
	use 'vim-airline/vim-airline'
	use { 'dracula/vim', as = 'dracula' }
	use 'rose-pine/neovim'
	use 'norcalli/nvim-colorizer.lua'

	-- syntax highlighting
	use 'sheerun/vim-polyglot' -- replace all specific highlights
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- file search
	use 'nvim-lua/plenary.nvim'
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { { 'nvim-lua/plenary.nvim' } } }
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- autocomplete plugins
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'mattn/emmet-vim'
	use 'github/copilot.vim' -- Github Copilot

	-- comment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- motion
	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}

	-- general plugins
	use 'wakatime/vim-wakatime' -- wakatime plugin
	use 'qstrahl/vim-matchmaker' -- highlight words under cursor
	use 'Yggdroot/indentLine' -- indent guides visually
	use 'editorconfig/editorconfig-vim' -- editor config for vim
	use 'tpope/vim-surround' -- helpers with surrounders
	use 'tpope/vim-repeat' -- improve repeat using .
	use 'tpope/vim-fugitive' -- git commands
	use 'kristijanhusak/vim-carbon-now-sh' -- integration with carbon.now.sh
	-- auto pairs related
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({ map_cr = false })
		end
	}
	--  git rleated
	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release',
		config = function()
			require('gitsigns').setup()
		end
	}
	-- shortcuts for pnpm|yarn|npm
	use {
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("package-info").setup()
		end
	}

	-- == Snippets ==
	--use 'SirVer/ultisnips'
	--use 'honza/vim-snippets'

	-- == General editor plugins ==
	--use 'airblade/vim-gitgutter' -- == git visually helpers
	--use 'shime/vim-livedown' -- == markdown live preview
end)
