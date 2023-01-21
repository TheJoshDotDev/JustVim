return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	},

	{
		"m4xshen/autoclose.nvim",
		opts = {},
	},

	-- UTILITY
	"christoomey/vim-tmux-navigator",
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>wm", "<cmd>MaximizerToggle<cr>", desc = "Toggle maximize current window" },
		},
	},

	-- STATUS
	"SmiteshP/nvim-navic",

	-- DOCUMENTATION
	"folke/which-key.nvim",
}
