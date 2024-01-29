return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	-- diagnostics
	build = ":TSUpdate",
	config = function()
		local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
		if not treesitter_ok then
			vim.notify("Treesitter not found", vim.log.levels.ERROR)
		end
		treesitter.setup({
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
