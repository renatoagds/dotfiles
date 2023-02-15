local utils = require('config.utils')
local nmap = utils.nmap

require('nvim-tree').setup({
    filters = {
        -- filter custom folder/files
        custom = {
            '.git',
            'node_modules'
        }
    },
    renderer = {
        -- add highlight for opened file
        highlight_opened_files = 'all'
    }
})

nmap('<leader>e', ':NvimTreeToggle<CR>')
nmap('<leader>r', ':NvimTreeRefresh<CR>')
nmap('<leader>n', ':NvimTreeFindFile<CR>')
