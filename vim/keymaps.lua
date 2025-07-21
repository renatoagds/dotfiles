if vim.g.vscode then
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
else
	-- regular NeoVim
end
