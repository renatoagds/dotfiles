local wk = require'which-key'

-- terminal
wk.register({
  ['<Esc>'] = {
    "<C-\\><C-n>",
    "Exit Terminal"
  },
}, {
  mode = 't',
})

-- normal
wk.register({
  ["<leader>"] = {
    w = {
      "<cmd>w<CR>",
      "Save"
    },
    c = {
      "<cmd>bd<CR>",
      "Close"
    },
    q = {
      "<cmd>q!<CR>",
      "Quit"
    },
    s = {
      name = "Split",
      H = {
        "<C-W><C-H>",
        "Left Split"
      },
      L = {
        "<C-W><C-L>",
        "Right Split"
      },
      J = {
        "<C-W><C-J>",
        "Bottom Split"
      },
      K = {
        "<C-W><C-K>",
        "Top Split"
      },
    },
  },
  ["<Tab>"] = {
    ">>",
    "Indent"
  },
  ["<S-Tab>"] = {
    "<<",
    "Unindent"
  },
})

-- visual
wk.register({
  ["<Tab>"] = {
    ">><Esc>gv",
    "Indent"
  },
  ["<S-Tab>"] = {
    "<<<Esc>gv",
    "Unindent"
  },
}, {
  mode = 'v'
})
