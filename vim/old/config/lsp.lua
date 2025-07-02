local cmp = require 'cmp'
local mason = require 'mason'
local mason_lsp = require 'mason-lspconfig'
local wk = require 'which-key'
local null_ls = require('null-ls')
local luasnip = require("luasnip")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local lsp_servers_settings = {
  lua_ls = {
    Lua = {
      -- Disable telemetry
      telemetry = { enable = false },
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' }
      },
      workspace = {
        checkThirdParty = false,
        library = {
          -- Make the server aware of Neovim runtime files
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.stdpath('config') .. '/lua'
        }
      }
    }
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
  ["<leader>l"] = {
    name = "+LSP"
  },
  ["<leader>lgl"] = {
    function()
      vim.diagnostic.open_float(0, { scope = 'line' })
    end,
    "Show diagnostics for current line",
    noremap = true,
    silent = true,
  }
})

-- mason
mason.setup()
mason_lsp.setup({
  ensure_installed = {
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
})

-- nvim-cmp | LuaSnip
require("luasnip.loaders.from_vscode").load({})

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body)   -- For `vsnip` users.
      luasnip.lsp_expand(args.body)  -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' }
  })
})

-- set up servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local get_servers = require('mason-lspconfig').get_installed_servers

for _, lsp in ipairs(get_servers()) do
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
            function()
              vim.lsp.buf.hover()
            end,
            "Show hover",
          },
          ["<C-k>"] = {
            function()
              vim.lsp.buf.signature_help()
            end,
            "Show signature help",
          },
          D = {
            function()
              vim.lsp.buf.declaration()
            end,
            "Go to declaration",
          },
          g = {
            name = "+Go to",
            D = {
              function()
                vim.lsp.buf.declaration()
              end,
              "Go to declaration",
            },
            d = {
              function()
                vim.lsp.buf.definition()
              end,
              "Go to definition",
            },
            i = {
              function()
                vim.lsp.buf.implementation()
              end,
              "Go to implementation",
            },
            r = {
              function()
                vim.lsp.buf.references()
              end,
              "Go to references",
            },
          },
          w = {
            name = "+Workspace",
            a = {
              function()
                vim.lsp.buf.add_workspace_folder()
              end,
              "Add workspace folder",
            },
            r = {
              function()
                vim.lsp.buf.remove_workspace_folder()
              end,
              "Remove workspace folder",
            },
            l = {
              function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
              end,
              "List workspace folders",
            },
          },
          c = {
            name = "+Code",
            a = {
              function()
                vim.lsp.buf.code_action()
              end,
              "Code action",
            },
            r = {
              function()
                vim.lsp.buf.rename()
              end,
              "Rename",
            },
            f = {
              function()
                vim.lsp.buf.format({
                  timeout_ms = 3000,
                  bufnr = ev.buf,
                  filter = function(client)
                    return client.name == "null-ls"
                  end
                })
              end,
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

-- signs
local signs = { Error = "", Warn = "", Hint = "", Info = "", Ok = "﫠" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- null-ls (linting, code actions and formatters)
null_ls.setup({
  sources = {
    -- JS
    null_ls.builtins.formatting.eslint.with({
      prefer_local = 'node_modules/.bin/',
    }),
    -- PHP
    null_ls.builtins.formatting.phpcbf.with({
      prefer_local = 'vendor/bin/',
    }),
    null_ls.builtins.diagnostics.phpcs.with({
      prefer_local = 'vendor/bin/',
    }),
  }
})
