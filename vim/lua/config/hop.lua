local wk = require'which-key'

wk.register({
  ['<leader><leader>'] = {
    name = '+Hop',
    w = {
      ':HopWordAC<CR>',
      'Jump to Word After Cursor'
    },
    b = {
      ':HopWordBC<CR>',
      'Jump to Word Before Cursor'
    },
  },
})
