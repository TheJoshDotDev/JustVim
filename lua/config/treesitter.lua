require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = {
		"javascript",
		"typescript",
		"bash",
		"html",
		"json",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"regex",
		"typescript",
		"yaml",
		"jsdoc",
		"go",
		"angular"
	},

	sync_install = false,
	auto_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-CR>",
			node_incremental = "<C-CR>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
}
