return {
	"nvim-lua/plenary.nvim",
	{
		"tpope/vim-sleuth",
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
					vim.cmd("Copilot enable")
				end,
			},
		},
		lazy = true,
	},
	{
		"christoomey/vim-tmux-navigator",
	},
}
