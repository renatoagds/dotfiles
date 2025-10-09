-- configuration for lazyvim plugins
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Frontend
        "css-variables-language-server",
        "css-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "superhtml",
        -- Python
        "pyright",
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
}
