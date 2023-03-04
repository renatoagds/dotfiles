local wk = require'which-key'

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

wk.register({
  ["<leader>"] = {
    e = {
      "<cmd>NvimTreeToggle<CR>",
      "Explorer"
    },
    r = {
      "<cmd>NvimTreeRefresh<CR>",
      "Tree Refresh"
    },
  },
})
