local utils = require('utils')
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local tmap = utils.tmap

-- map esc on terminal
tmap('<Esc>', '<C-\\><C-n>')

-- save and close (only buffer)
nmap(';;', ':w<CR>')
nmap('<C-B>', ':bd<CR>')
nmap('<C-W>', ':q!<CR>')

-- navigation between splits
nmap('H', '<C-W><C-H>')
nmap('L', '<C-W><C-L>')
nmap('J', '<C-W><C-J>')
nmap('K', '<C-W><C-K>')

-- space with tab
nmap('<Tab>', '>>')
nmap('<S-Tab>', '<<')
vmap('<Tab>', '>><Esc>gv')
vmap('<S-Tab>', '<<<Esc>gv')

-- no arrow on insert
imap('<Up>', '<Nop>')
imap('<Down>', '<Nop>')
imap('<Left>', '<Nop>')
imap('<Right>', '<Nop>')
