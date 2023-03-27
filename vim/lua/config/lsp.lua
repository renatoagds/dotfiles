local cmp = require'cmp'
local mason = require'mason'
local mason_lsp = require'mason-lspconfig'
local wk = require'which-key'

local lsp_servers = {
  -- frontend
  "html",
  "cssls",
  "tsserver",
  "angularls",
  "tailwindcss",
  "eslint",
  "stylelint_lsp",
  -- backend
  "intelephense",
  "lua_ls",
  -- general
  "bashls",
  "jsonls",
  "vimls",
  -- disabled
  -- "pyright",
  -- "graphql",
  -- "dockerls",
  -- "vuels",
  -- "svelte",
  -- "yamlls",
  -- "diagnosticls",
  -- "marksman"
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
    diagnostics = {
      ignoredCodes = {
        7016, -- 'Could not find a declaration file for module ''{0}'''
      },
    }
  },
}

-- set jsonc for tsconfig.json and coc-settings.json
vim.cmd([[
  autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
  autocmd BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc
]])

-- mapping
wk.register({
  ["<leader>l"] = { name = "+LSP" },
  ["<leader>lgl"] = {
    "<cmd>lua vim.diagnostic.open_float<CR>",
    "Show diagnostics for current line",
    noremap = true,
    silent = true,
  }
})

-- mason
mason.setup()
mason_lsp.setup({ ensure_installed = lsp_servers })

-- nvim-cmp
cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
  })
})

-- set up servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(lsp_servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    settings = lsp_servers_settings[lsp],
  }
end

-- attach function
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- mappings
    wk.register({
      ["<leader>"] = {
        -- +LSP
        l = {
          K = {
            "<cmd>lua vim.lsp.buf.hover()<CR>",
            "Show hover",
          },
          ["<C-k>"] = {
            "<cmd>lua vim.lsp.buf.signature_help()<CR>",
            "Show signature help",
          },
          D = {
            "<cmd>lua vim.lsp.buf.declaration()<CR>",
            "Go to declaration",
          },
          g = {
            name = "+Go to",
            D = {
              "<cmd>lua vim.lsp.buf.declaration()<CR>",
              "Go to declaration",
            },
            d = {
              "<cmd>lua vim.lsp.buf.definition()<CR>",
              "Go to definition",
            },
            i = {
              "<cmd>lua vim.lsp.buf.implementation()<CR>",
              "Go to implementation",
            },
            r = {
              "<cmd>lua vim.lsp.buf.references()<CR>",
              "Go to references",
            },
          },
          w = {
            name = "+Workspace",
            a = {
              "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
              "Add workspace folder",
            },
            r = {
              "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
              "Remove workspace folder",
            },
            l = {
              "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
              "List workspace folders",
            },
          },
          c = {
            name = "+Code",
            a = {
              "<cmd>lua vim.lsp.buf.code_action()<CR>",
              "Code action",
            },
            r = {
              "<cmd>lua vim.lsp.buf.rename()<CR>",
              "Rename",
            },
            f = {
              "<cmd>lua vim.lsp.buf.formatting()<CR>",
              "Format",
            },
          },
        }
      }
    }, {
      noremap = true,
      silent = true,
      buffer = ev.buf,
    })
  end,
})
