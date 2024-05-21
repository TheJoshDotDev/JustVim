return {
	"nvim-lua/plenary.nvim",
	{
		"tpope/vim-sleuth",
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		conftig = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		opts = {},
	},
	{
		"christoomey/vim-tmux-navigator",
	},
}
