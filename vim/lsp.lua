-- configuration for lazyvim plugins
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Frontend
        "css-variables-language-server",
        "css-lsp",
        "tailwindcss-language-server",
        "superhtml",
        -- Python
        "pyright",
        -- Copilot
        "copilot-language-server",
        -- General
        "dockerfile-language-server",
        "yaml-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(p)
        return not vim.tbl_contains({ "jsonc" }, p)
      end, opts.ensure_installed)
    end,
  },
}
