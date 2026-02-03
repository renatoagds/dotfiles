if not vim.g.vscode then
  -- Normal Mode: Copy "@path:line"
  vim.keymap.set("n", "<leader>cy", function()
    local path = vim.fn.expand("%:.")
    local line = vim.fn.line(".")
    local result = string.format("@%s:%s", path, line)
    vim.fn.setreg("+", result)
    vim.notify("Copied: " .. result)
  end, { desc = "Copy @Path:Line" })

  -- Visual Mode: Copy "@path:start-end" (same format as normal)
  vim.keymap.set("v", "<leader>cy", function()
    local path = vim.fn.expand("%:.")
    local sline = vim.fn.line("v")
    local eline = vim.fn.line(".")

    -- Ensure sline is the smaller number
    if sline > eline then
      sline, eline = eline, sline
    end

    local result = string.format("@%s:%d-%d", path, sline, eline)

    vim.fn.setreg("+", result)
    vim.notify("Copied: " .. result)
  end, { desc = "Copy @Path:Range" })
else
  -- VSCode
  local vscode = require("vscode")

  vim.keymap.set("n", "<leader>cr", function()
    vscode.action("editor.action.rename")
  end)

  vim.keymap.set("n", "<leader>w", function()
    vscode.action("workbench.action.files.save")
  end)

  vim.keymap.set("n", "<leader>bd", function()
    vscode.action("workbench.action.closeActiveEditor")
  end)
end
