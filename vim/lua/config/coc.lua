local npairs = require('nvim-autopairs')
local utils = require('config.utils')

local keyset = vim.keymap.set
local vmap = utils.vmap
local nmap = utils.nmap

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

-- global mutils
_G.MUtils = {}

-- check if has completion or not
MUtils.completion_confirm = function()
    if vim.fn["coc#pum#visible"]() ~= 0 then
        return vim.fn["coc#pum#confirm"]()
    else
        return npairs.autopairs_cr()
    end
end

-- global autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- global show docs
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- format range code
vmap("<leader>f", "<Plug>(coc-format-selected)")
nmap("<leader>f", "<Plug>(coc-format-selected)")

-- rename all references
nmap("<leader>rn", "<Plug>(coc-rename)")

-- go to definition/references
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

-- list all lint errors
keyset("n", "<leader>l", ":<C-u>CocList diagnostics<cr>")

-- navigate thru lint errors
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- use K to show documentation in preview window
keyset("n", "<C-K>", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- trigger completion list
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- navigate with tab on completion list
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- confirm completion on enter
keyset('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })

-- list of extensions
vim.g.coc_global_extensions = {
    'coc-tsserver',
    'coc-eslint',
    'coc-json',
    'coc-html',
    'coc-css',
    'coc-snippets',
    'coc-prettier',
    'coc-lists',
    'coc-phpls',
    'coc-sumneko-lua',
    'coc-diagnostic'
}
