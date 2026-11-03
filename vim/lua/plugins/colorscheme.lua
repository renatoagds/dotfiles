return {
  {
    dir = vim.fn.expand("~/.local/share/nvim/site/pack/themes/start/dracula-pro"),
    name = "dracula-pro",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.dracula_colorterm = 0
    end,
  },
  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula-pro",
    },
  },
}
