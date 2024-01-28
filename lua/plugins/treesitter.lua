return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	-- diagnostics
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
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
				"dart",
				"tsx",
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
					init_selection = "<C-]>",
					node_incremental = "<C-]>",
					scope_incremental = false,
					node_decremental = "<C-[>]",
				},
			},
		})
	end,
}
