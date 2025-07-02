local wk = require 'which-key'

-- terminal
wk.add({
  { "<Esc>", "<C-\\><C-n>", desc = "Exit Terminal", mode = "t" }
})

-- normal and visual
wk.add({
  { "<leader>w", "<cmd>w<CR>", desc = "Save" },
  { "<leader>c", "<cmd>bd<CR>", desc = "Close" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "Clear Highlight" },
  { "<leader>s", group = "Split" },
  { "<leader>sH", "<C-W><C-H>", desc = "Left Split" },
  { "<leadersL", "<C-W><C-L>", desc = "Right Split"},
  { "<leader>sJ", "<C-W><C-J>", desc = "Bottom Split" },
  { "<leader>sK", "<C-W><C-K>", desc = "Top Split" },
  { "<Tab>", ">>", desc = "Indent", mode = { "n", "v" } },
  { "<S-Tab>", "<<", desc = "Unindent", mode = { "n", "v" } },
})