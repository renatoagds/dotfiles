local wk = require 'which-key'

wk.add({
  { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 1" },
  { "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "Buffer 2" },
  { "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "Buffer 3" },
  { "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "Buffer 4" },
  { "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", desc = "Buffer 5" },
  { "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", desc = "Buffer 6" },
  { "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", desc = "Buffer 7" },
  { "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", desc = "Buffer 8" },
  { "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", desc = "Buffer 9" },
  { "<leader><lt>", "<cmd>BufferLineMovePrev<CR>", desc = "Move Buffer Left" },
  { "<leader>>", "<cmd>BufferLineMoveNext<CR>", desc = "Move Buffer Right" },
})
