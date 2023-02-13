-- Main Config
lvim.leader = ","
vim.cmd([[
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	filetype plugin on
	syntax enable
]])

-- Lunar specifics
lvim.reload_config_on_save = false
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.format_on_save.timeout = 2000
lvim.colorscheme = "lunar"
-- lvim.builtin.nvimtree.setup.open_on_setup = true
-- lvim.builtin.nvimtree.setup.open_on_setup_file = true
-- lvim.lsp.null_ls.setup = { debug = true }
-- lvim.use_icons = false -- to disable icons

-- NeoVim options
vim.o.clipboard = 'unnamed'
vim.o.termguicolors = true
vim.o.cmdheight = 2
vim.o.foldmethod = 'manual'
vim.o.completeopt = 'preview'
vim.o.showcmd = true -- Show (partial) command in status line.
vim.o.showmatch = true -- Show matching brackets.
vim.o.showmode = true -- Show current mode.
vim.o.ruler = true -- Show the line and column numbers of the cursor.
vim.o.number = true -- Show the line numbers on the left side.
vim.o.relativenumber = true -- Show the relative numbers on the left side.
vim.o.textwidth = 0 -- Hard-wrap long lines as you type them.
vim.o.expandtab = true -- Insert spaces when TAB is pressed.
vim.o.tabstop = 2 -- Render TABs using this many spaces.
vim.o.shiftwidth = 2 -- Indentation amount for < and > commands.
vim.o.noerrorbells = true -- No beeps.
vim.o.modeline = true -- Enable modeline.
vim.o.esckeys = true -- Cursor keys in insert mode.
vim.o.linespace = 0 -- Set line-spacing to minimum.
vim.o.nojoinspaces = true -- Prevents inserting two spaces after punctuation on a join (J)
vim.o.splitbelow = true -- Horizontal split below current.
vim.o.splitright = true -- Vertical split to right of current.
vim.o.scrolloff = 6 -- Show next 3 lines while scrolling.
vim.o.sidescrolloff = 5 -- Show next 5 columns while side-scrolling.
vim.o.nostartofline = true -- Do not jump to first character with page commands.
vim.o.display = 'lastline'

-- mkdir recursive (create folder if don't exists) ==
vim.cmd([[
	augroup Mkdir
		autocmd!
		autocmd BufWritePre *
			\ if !isdirectory(expand("<afile>:p:h")) |
					\ call mkdir(expand("<afile>:p:h"), "p") |
			\ endif
	augroup END
]])

-- crontab related (disable backup when editing it)
vim.cmd([[
	autocmd filetype crontab setlocal nobackup nowritebackup
]])

-- automatic define filetype for flow files
-- flow to javascript.jsx
vim.cmd([[
	augroup FiletypeGroup
		autocmd!
		au BufNewFile,BufRead *.flow set filetype=javascript.jsx
	augroup END
]])


-- keymappings
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode[";;"] = ":w<cr>"
-- lvim.keys.normal_mode["<C-w>"] = ":bd<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>1"] = ":BufferLineGoToBuffer 1<CR>"
lvim.keys.normal_mode["<leader>2"] = ":BufferLineGoToBuffer 2<CR>"
lvim.keys.normal_mode["<leader>3"] = ":BufferLineGoToBuffer 3<CR>"
lvim.keys.normal_mode["<leader>4"] = ":BufferLineGoToBuffer 4<CR>"
lvim.keys.normal_mode["<leader>5"] = ":BufferLineGoToBuffer 5<CR>"
lvim.keys.normal_mode["<leader>6"] = ":BufferLineGoToBuffer 6<CR>"
lvim.keys.normal_mode["<leader>7"] = ":BufferLineGoToBuffer 7<CR>"
lvim.keys.normal_mode["<leader>8"] = ":BufferLineGoToBuffer 8<CR>"
lvim.keys.normal_mode["<leader>9"] = ":BufferLineGoToBuffer 9<CR>"

-- Config for core plugins
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- bufferline
lvim.builtin.bufferline.options.numbers = "ordinal"

-- treesitter
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "php"
}

-- matchmaker
vim.g.matchmaker_matchpriority = -1 -- avoid conflict with motion/hop
vim.g.matchmaker_ignore_single_match = 1 -- disable highlight on single match
vim.g.matchmaker_enable_startup = 1

-- null-ls
local linters = require "lvim.lsp.null-ls.linters"
local code_actions = require "lvim.lsp.null-ls.code_actions"
local formatters = require "lvim.lsp.null-ls.formatters"

linters.setup {
  {
    command = 'eslint'
  },
  {
    command = 'phpcs'
  }
}

formatters.setup {
  {
    command = 'eslint'
  },
  {
    command = 'phpcbf'
  }
}

code_actions.setup {
  {
    command = 'eslint'
  }
}

-- increase format timeout

lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 5000 }
  end,
  "Format",
}

-- Additional Plugins

lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "<leader><leader>w", ":HopWordAC<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader><leader>b", ":HopWordBC<cr>", { silent = true })
    end,
  },
  {
    'wakatime/vim-wakatime'
  },
  {
    'editorconfig/editorconfig-vim',
    config = function()
      -- exclude patterns for editor config
      vim.g.EditorConfig_exclude_patterns = {
        'fugitive://.*',
        'scp://.*'
      }
    end
  },
  {
    'github/copilot.vim'
  },
  {
    'norcalli/nvim-colorizer.lua'
  },
  {
    'kristijanhusak/vim-carbon-now-sh'
  },
  {
    'mattn/emmet-vim'
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
