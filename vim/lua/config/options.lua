vim.g.mapleader = ","
vim.g.ai_cmp = false

-- dracula
local dracula_pro = "dracula_pro"
vim.g.dracula_colorterm = 0
vim.opt.packpath:append(os.getenv("HOME") .. "/.local/share/nvim/site")
vim.cmd("colorscheme " .. dracula_pro)
