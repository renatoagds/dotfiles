return require('packer').startup(function(use)
  -- core
	use 'nvim-lua/plenary.nvim'
	-- lsp
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim'
  }
	-- styling and themes
  use 'folke/tokyonight.nvim' -- theme
	use {
    'norcalli/nvim-colorizer.lua', -- show background color
    config = function()
      require('colorizer').setup()
    end
  }
	use {
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('bufferline').setup {
				options = {
					numbers = function(opts)
						return string.format('%s.', opts.ordinal)
					end
				}
			}
		end
	}
	-- syntax highlighting (treesitter)
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- file search
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { { 'nvim-lua/plenary.nvim' } } }
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	-- autocomplete plugins
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
    },
  }
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
	-- auto pairs
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({ map_cr = false })
		end
	}
	--  git related
	use {
		'lewis6991/gitsigns.nvim',
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
	-- dap
	use { 'rcarriga/nvim-dap-ui',
		requires = {
			'mfussenegger/nvim-dap',
			'nvim-telescope/telescope-dap.nvim',
			{
				'theHamsta/nvim-dap-virtual-text',
				config = function()
					require('nvim-dap-virtual-text').setup{}
				end
			}
		},
		config = function()
			require('dapui').setup()
		end
	}
	-- which-key
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup{}
		end
	}
	-- togleterm
	use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup({
        direction = "float",
        open_mapping = [[<c-\>]],
      })
    end
  }
  -- trouble
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        position = "right", -- position of the list can be: bottom, top, left, right
        auto_open = true, -- automatically open the list when you have diagnostics
        auto_close = true, -- automatically close the list when you have no diagnostics
        use_diagnostic_signs = true, -- use the signs defined in your lsp client
      }
    end
  }
	-- general plugins
	use 'wakatime/vim-wakatime' -- wakatime plugin
	use 'qstrahl/vim-matchmaker' -- highlight words under cursor
	use 'lukas-reineke/indent-blankline.nvim' -- indent guides visually
	use 'editorconfig/editorconfig-vim' -- editor config for vim
	use 'tpope/vim-surround' -- helpers with surrounders
	use 'tpope/vim-repeat' -- improve repeat using .
	use 'tpope/vim-fugitive' -- git commands
	use 'kristijanhusak/vim-carbon-now-sh' -- integration with carbon.now.sh
	------------------
	------------------
	------------------
	--DEPRECATED
	--use 'vim-airline/vim-airline'
	--use 'SirVer/ultisnips'
	--use 'honza/vim-snippets'
	--use 'airblade/vim-gitgutter' -- == git visually helpers
	--use 'shime/vim-livedown' -- == markdown live preview
end)
