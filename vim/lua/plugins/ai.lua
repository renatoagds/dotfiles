return {
  {
    "leonardcser/cursortab.nvim",
    -- version = "*",  -- Use latest tagged version for more stability
    lazy = false, -- The server is already lazy loaded
    build = "cd server && go build",
    opts = {
      provider = {
        type = "copilot",
      },
      keymaps = {
        accept = "a",
        partial_accept = "b",
      },
    },
  },
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = false,
      },
    },
  },
}
