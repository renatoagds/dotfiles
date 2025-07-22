vim.g.mapleader = ","
vim.g.ai_cmp = false

if vim.g.vscode then
	local vscode = require("vscode")

	vscode.update_config("editor.fontSize", 13, "global")
	vscode.update_config("editor.lineNumbers", "relative", "global")
	vscode.update_config("editor.fontFamily", "Fira Code", "global")
	vscode.update_config("editor.formatOnSave", true, "global")
	vscode.update_config("editor.wordWrap", "on", "global")

	vscode.update_config("window.zoomLevel", 1, "global")
	vscode.update_config("window.commandCenter", true, "global")

	vscode.update_config("workbench.colorTheme", "Dracula Theme", "global")
	vscode.update_config("workbench.activityBar.location", "default", "global")
	vscode.update_config("workbench.activityBar.orientation", "vertical", "global")
	vscode.update_config("workbench.sideBar.location", "right", "global")

	vscode.update_config("search.followSymlinks", false, "global")

	vscode.update_config("extensions.autoUpdate", "onlyEnabledExtensions", "global")
end
