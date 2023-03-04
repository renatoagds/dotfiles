local wk = require'which-key'

--- mappings for telescope
wk.register({
  ['<leader>'] = {
    f = {
      name = "Find",
      f = {
        "<cmd>Telescope find_files theme=dropdown<cr>",
        "Find Files"
      },
      g = {
        "<cmd>Telescope live_grep theme=dropdown<cr>",
        "Find Grep"
      },
      d = {
        "<cmd>Telescope treesitter theme=dropdown<cr>",
        "Find Definition"
      },
      r = {
        "<cmd>Telescope oldfiles theme=dropdown<cr>",
        "Find Recent Files"
      },
    },
  },
})

-- extensions
require('telescope').load_extension('dap')
