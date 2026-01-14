if not vim.g.vscode then
  -- regular NeoVim
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
