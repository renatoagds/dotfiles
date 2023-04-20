local dap = require('dap')
local dapui = require('dapui')
local wk = require 'which-key'
local masondap = require('mason-nvim-dap')

-- config
masondap.setup({
    ensure_installed = { "php" },
    handlers = {
      function (config)
        -- all sources without handler
        masondap.default_setup(config)
      end,
      php = function (config)
        local function workspace()
          local cwd = vim.fn.getcwd()
          local cmd = io.popen('cd ' .. cwd .. ' && git rev-parse --show-toplevel')
          local path = cmd:read("*a")
          path = path:gsub("[\n\r]", "")
          cmd:close()
          return path
        end

        config.configurations = {
          {
            type = "php",
            request = "launch",
            name = "Jetpack",
            port = 9003,
            pathMappings = function ()
              local workspacePath = workspace()
              return {
                ["/usr/local/src/jetpack-monorepo"] = workspacePath,
                ["/var/www/html"] = workspacePath .. "/tools/docker/wordpress"
              }
            end
          }
        }

        masondap.default_setup(config)
      end,
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- mappings
wk.register({
  ["<leader>d"] = {
    name = "+Dap",
    x = {
      function ()
        dapui.toggle()
      end,
      "Toogle UI"
    },
    d = {
      function ()
        dap.continue()
      end,
      "Continue"
    },
    s = {
      function ()
        dap.close()
      end,
      "Close"
    },
    c = {
      function ()
        dap.disconnect()
      end,
      "Disconnect"
    },
    b = {
      function ()
        dap.toggle_breakpoint()
      end,
      "Toggle Breakpoint"
    },
    o = {
      function ()
        dap.step_over()
      end,
      "Step Over"
    },
    i = {
      function ()
        dap.step_into()
      end,
      "Step Into"
    },
    u = {
      function ()
        dap.step_out()
      end,
      "Step Out"
    },
    l = {
      function ()
        dap.run_last()
      end,
      "Run Last"
    }
  }
})

-- nmap('<leader>dr', '<cmd>lua require("dap").repl.open()<CR>')
-- nmap('<leader>dt', '<cmd>lua require("dap").run_to_cursor()<CR>')
-- nmap('<leader>dv', '<cmd>lua require("dap").ui.variables()<CR>')
-- nmap('<leader>df', '<cmd>lua require("dap").ui.frames()<CR>')
-- nmap('<leader>dn', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- nmap('<leader>dm', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- nmap('<leader>dk', '<cmd>lua require("dap").up()<CR>')
-- nmap('<leader>dj', '<cmd>lua require("dap").down()<CR>')
