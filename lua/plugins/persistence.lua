return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>qs",
			'<cmd>lua require("persistence").load()<cr>',
		},
	},
	opts = {},
}
