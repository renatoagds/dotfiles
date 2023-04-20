local wk = require 'which-key'

wk.register({
  ['<leader><leader>'] = {
    name = '+Hop',
    -- waiting for: https://github.com/phaazon/hop.nvim/issues/335
    -- to return using AC and BC
    --[[ w = {
      ':HopWordAC<CR>',
      'Jump to Word After Cursor'
    },
    b = {
      ':HopWordBC<CR>',
      'Jump to Word Before Cursor'
    }, ]]
    w = {
      ':HopWord<CR>',
      'Jump to any word',
    },
  },
})
