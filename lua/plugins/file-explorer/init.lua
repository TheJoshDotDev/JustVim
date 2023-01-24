local nvimtree_opts = require("plugins.file-explorer.config.opts").nvimtree_opts
local nvimtree_config = require("plugins.file-explorer.config.nvim-tree")
return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		-- Add vscode like icons to nvim
		"nvim-tree/nvim-web-devicons",
	},
	opts = nvimtree_opts,
	config = nvimtree_config.setup,
}
