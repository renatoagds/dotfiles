return {
	{
		"saghen/blink.cmp",
		opts = function(_, opts)
			opts.appearance = opts.appearance or {}
			opts.appearance.kind_icons =
				vim.tbl_extend("force", opts.appearance.kind_icons or {}, LazyVim.config.icons.kinds, {
					Copilot = LazyVim.config.icons.kinds.Copilot or "",
				})
		end,
	},
}
