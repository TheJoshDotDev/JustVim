local M = {}
M.telescope_opts = {
	defaults = {
		file_ignore_patterns = { "node_modules", ".git", ".cache" },
		prompt_prefix = " ",
		selection_caret = "﬌ ",
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "top" },
		sorting_strategy = "ascending",
		winblend = 0,
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
}
return M
