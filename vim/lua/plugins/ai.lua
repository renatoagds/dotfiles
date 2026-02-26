return {
  {
    "leonardcser/cursortab.nvim",
    -- version = "*",  -- Use latest tagged version for more stability
    lazy = false, -- The server is already lazy loaded
    build = "cd server && go build",
    config = function()
      require("cursortab").setup({
        provider = {
          type = "copilot",
        },
      })
    end,
  },
}
