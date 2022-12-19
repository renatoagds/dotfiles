local utils = require('utils')
local nmap = utils.nmap

--- mappings for telescope
nmap('<leader>ff', '<cmd>Telescope find_files theme=dropdown<cr>')
nmap('<leader>fg', '<cmd>Telescope live_grep theme=dropdown<cr>')
nmap('<leader>fd', '<cmd>Telescope treesitter theme=dropdown<cr>')

-- extensions
require('telescope').load_extension('dap')
