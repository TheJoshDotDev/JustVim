local gitsigns_opts = require("plugins.git.opts.gitsigns")

return {
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		opts = gitsigns_opts,
	},
}
