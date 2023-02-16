local symbol_outline_opts = require("plugins.editor.opts.symbols-outline")
local indent_blankline_opts = require("plugins.editor.opts.blankline")

return {
	{ "christoomey/vim-tmux-navigator" },
	{ "mbbill/undotree" },
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = indent_blankline,
	},
	{
		"folke/todo-comments.nvim",
		lazy = false,
		keys = {
			{ "<leader>tc", "<cmd>TodoTelescope<cr>", desc = "Search for TODOs" },
		},
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*]],
			},
		},
	},
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Toggle maximize current window" },
		},
	},
	{
		"m4xshen/autoclose.nvim",
		opts = {},
	},
	{
		"simrat39/symbols-outline.nvim",
		keys = {
			{ "<leader>so", "<cmd>SymbolsOutline<cr>", "Open file outline" },
		},
		opts = symbol_outline_opts,
	},
}
