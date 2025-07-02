local wk = require 'which-key'

wk.add({
  { "<leader><leader>", group = "+Hop" },
  { "<leader><leader>w", ':HopWord<CR>', desc = 'Jump to any word' },
})
