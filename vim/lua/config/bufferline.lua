local wk = require 'which-key'

wk.register({
  ["<leader>1"] = {
    "<cmd>BufferLineGoToBuffer 1<CR>",
    "Buffer 1"
  },
  ["<leader>2"] = {
    "<cmd>BufferLineGoToBuffer 2<CR>",
    "Buffer 2"
  },
  ["<leader>3"] = {
    "<cmd>BufferLineGoToBuffer 3<CR>",
    "Buffer 3"
  },
  ["<leader>4"] = {
    "<cmd>BufferLineGoToBuffer 4<CR>",
    "Buffer 4"
  },
  ["<leader>5"] = {
    "<cmd>BufferLineGoToBuffer 5<CR>",
    "Buffer 5"
  },
  ["<leader>6"] = {
    "<cmd>BufferLineGoToBuffer 6<CR>",
    "Buffer 6"
  },
  ["<leader>7"] = {
    "<cmd>BufferLineGoToBuffer 7<CR>",
    "Buffer 7"
  },
  ["<leader>8"] = {
    "<cmd>BufferLineGoToBuffer 8<CR>",
    "Buffer 8"
  },
  ["<leader>9"] = {
    "<cmd>BufferLineGoToBuffer 9<CR>",
    "Buffer 9"
  },
  ["<leader><lt>"] = {
    "<cmd>BufferLineMovePrev<CR>",
    "Move Buffer Left"
  },
  ["<leader>>"] = {
    "<cmd>BufferLineMoveNext<CR>",
    "Move Buffer Right"
  },
})
