-- Python
local home = os.getenv('HOME')
vim.g.python_host_prog = home .. '/.pyenv/versions/neovim2/bin/python'
vim.g.python3_host_prog = home .. '/.pyenv/versions/neovim3/bin/python'
vim.g.wakatime_PythonBinary = home .. '/.pyenv/versions/neovim3/bin/python'

-- change Matchmaker to use underline
vim.cmd('highlight link Matchmaker underlined')

-- General Config
require('plugins')
require('settings')
require('mappings')
require('config.setup')

-- Plugins Config/Mappings
