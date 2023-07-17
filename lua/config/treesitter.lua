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
		"go"
	},

	sync_install = false,
	auto_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
