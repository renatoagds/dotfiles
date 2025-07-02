-- Main Config
vim.cmd([[
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	filetype plugin on
	syntax enable
]])

-- Config
vim.o.cmdheight = 2
vim.o.foldmethod = 'manual'
vim.o.completeopt = 'preview'
vim.o.showcmd = true        -- Show (partial) command in status line.
vim.o.showmatch = true      -- Show matching brackets.
vim.o.showmode = true       -- Show current mode.
vim.o.ruler = true          -- Show the line and column numbers of the cursor.
vim.o.number = true         -- Show the line numbers on the left side.
vim.o.relativenumber = true -- Show the relative numbers on the left side.
vim.o.textwidth = 0         -- Hard-wrap long lines as you type them.
vim.o.expandtab = true      -- Insert spaces when TAB is pressed.
vim.o.tabstop = 2           -- Render TABs using this many spaces.
vim.o.shiftwidth = 2        -- Indentation amount for < and > commands.
vim.o.errorbells = true     -- No beeps.
vim.o.modeline = true       -- Enable modeline.
vim.o.linespace = 0         -- Set line-spacing to minimum.
vim.o.splitbelow = true     -- Horizontal split below current.
vim.o.splitright = true     -- Vertical split to right of current.
vim.o.scrolloff = 6         -- Show next 3 lines while scrolling.
vim.o.sidescrolloff = 5     -- Show next 5 columns while side-scrolling.
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

-- automatic define filetype for files
-- flow to javascript.jsx
vim.cmd([[
	augroup FiletypeGroup
		autocmd!
		au BufNewFile,BufRead *.flow set filetype=javascript.jsx
	augroup END
]])
