local trouble_keys = require("plugins.errors.trouble.keys")
return {
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = trouble_keys,
		opts = {},
	},
}
