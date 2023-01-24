local gitsigns_opts = require("plugins.editor.config.opts").gitsigns_opts

return {
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		opts = gitsigns_opts,
	}
}
