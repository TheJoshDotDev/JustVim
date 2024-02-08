return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>ls",
			'<cmd>lua require("persistence").load()<cr>',
		},
	},
	opts = {},
}
