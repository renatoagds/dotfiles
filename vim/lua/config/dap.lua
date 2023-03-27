local utils = require('config.utils')
local dap = require('dap')
local dapui = require('dapui')
local nmap = utils.nmap

-- config
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.config/nvim/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Jetpack",
    port = 9003,
    pathMappings = {
      ["/usr/local/src/jetpack-monorepo"] = "${workspaceFolder}",
      ["/var/www/html"] = "${workspaceFolder}/tools/docker/wordpress"
    }
  }
}

-- dapui
nmap('<leader>dx', '<cmd>lua require("dapui").toggle()<CR>')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- keymaps
nmap('<leader>dd', '<cmd>lua require("dap").continue()<CR>')
nmap('<leader>ds', '<cmd>lua require("dap").close()<CR>')
nmap('<leader>dc', '<cmd>lua require("dap").disconnect()<CR>')

nmap('<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
nmap('<leader>do', '<cmd>lua require("dap").step_over()<CR>')
nmap('<leader>di', '<cmd>lua require("dap").step_into()<CR>')
nmap('<leader>du', '<cmd>lua require("dap").step_out()<CR>')
nmap('<leader>dl', '<cmd>lua require("dap").run_last()<CR>')

-- nmap('<leader>dr', '<cmd>lua require("dap").repl.open()<CR>')
-- nmap('<leader>dt', '<cmd>lua require("dap").run_to_cursor()<CR>')
-- nmap('<leader>dv', '<cmd>lua require("dap").ui.variables()<CR>')
-- nmap('<leader>df', '<cmd>lua require("dap").ui.frames()<CR>')
-- nmap('<leader>dn', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- nmap('<leader>dm', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- nmap('<leader>dk', '<cmd>lua require("dap").up()<CR>')
-- nmap('<leader>dj', '<cmd>lua require("dap").down()<CR>')
