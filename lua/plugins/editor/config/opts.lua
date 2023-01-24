local M = {}

M.gitsigns_opts = {
	signs = {
		add = { text = "+" },
		change = { text = "┊" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
	current_line_blame = true,
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	current_line_blame_opts = {
		delay = 200,
		ignore_whitespace = true,
	},
}

M.indentscope_opts = {
	symbol = "│",
	options = { try_as_border = true },
}

M.indent_blankline_opts = {
	-- char = "┊",
	char = "│",
	show_trailing_blankline_indent = true,
}

M.symbol_outline_opts = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
	position = "right",
	relative_width = true,
	width = 30,
	auto_close = true,
	show_numbers = true,
	show_relative_numbers = true,
	show_symbol_details = true,
	preview_bg_highlight = "Pmenu",
	autofold_depth = 2,
	auto_unfold_hover = true,
	fold_markers = { "", "" },
	wrap = false,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = "", hl = "@text.uri" },
		Module = { icon = "", hl = "@namespace" },
		Namespace = { icon = "", hl = "@namespace" },
		Package = { icon = "", hl = "@namespace" },
		Class = { icon = "𝓒", hl = "@type" },
		Method = { icon = "ƒ", hl = "@method" },
		Property = { icon = "", hl = "@method" },
		Field = { icon = "", hl = "@field" },
		Constructor = { icon = "", hl = "@constructor" },
		Enum = { icon = "ℰ", hl = "@type" },
		Interface = { icon = "ﰮ", hl = "@type" },
		Function = { icon = "ƒ", hl = "@function" },
		Variable = { icon = "", hl = "@constant" },
		Constant = { icon = "", hl = "@constant" },
		String = { icon = "𝓐", hl = "@string" },
		Number = { icon = "#", hl = "@number" },
		Boolean = { icon = "⊨", hl = "@boolean" },
		Array = { icon = "", hl = "@constant" },
		Object = { icon = "⦿", hl = "@type" },
		Key = { icon = "", hl = "@type" },
		Null = { icon = "ﳠ", hl = "@type" },
		EnumMember = { icon = "", hl = "@field" },
		Struct = { icon = "𝓢", hl = "@type" },
		Event = { icon = "🗲", hl = "@type" },
		Operator = { icon = "+", hl = "@operator" },
		TypeParameter = { icon = "𝙏", hl = "@parameter" },
	},
}

return M
