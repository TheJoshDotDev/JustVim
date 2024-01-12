return {
	"nvim-lua/plenary.nvim",
	{
		"tpope/vim-sleuth",
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		opts = {},
	},
	{
		"github/copilot.vim",
		keys = {
			{
				"<leader>cp",
				function()
					vim.cmd("Copilot")
				end,
			},
		},
		lazy = true,
	},
	{
		"christoomey/vim-tmux-navigator",
	},
	{
		"echasnovski/mini.bufremove",
		version = "*",
		keys = {
			{
				"<leader>q",
				function()
					require("mini.bufremove").delete(0, true)
				end,
			},
		},
		opts = {},
	},
}
