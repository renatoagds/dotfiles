vim.g.mapleader = ","
vim.g.ai_cmp = false

if vim.g.vscode then
	local vscode = require("vscode")

	vscode.update_config("editor.fontSize", 13, "global")
	vscode.update_config("editor.lineNumbers", "relative", "global")
	vscode.update_config("editor.fontFamily", "Fira Code", "global")
	vscode.update_config("window.zoomLevel", 1, "global")
	vscode.update_config("window.commandCenter", true, "global")
	vscode.update_config("workbench.colorTheme", "Dracula Theme", "global")
end

