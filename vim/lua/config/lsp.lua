local cmp = require'cmp'
local mason = require'mason'
local mason_lsp = require'mason-lspconfig'

local lsp_servers = {
  -- frontend
  "html",
  "cssls",
  "tsserver",
  "angularls",
  "vuels",
  "svelte",
  "tailwindcss",
  "eslint",
  "stylelint_lsp",
  -- backend
  "intelephense",
  "pyright",
  "lua_ls",
  "graphql",
  "dockerls",
  -- general
  "bashls",
  "jsonls",
  "vimls",
  "yamlls",
  "diagnosticls",
  "marksman"
}

local lsp_servers_settings = {
  lua_ls = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  tsserver = {
    documentFormatting = false,
  },
}

mason.setup()

mason_lsp.setup({ ensure_installed = lsp_servers })

cmp.setup({
  -- snippet = {
  --   -- REQUIRED - you must specify a snippet engine
  --   expand = function(args)
  --     -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --     -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --   end,
  -- },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  })
})

-- set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(lsp_servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    settings = lsp_servers_settings[lsp],
  }
end
