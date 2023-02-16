local trouble_map = require("plugins.errors.config.keymaps").trouble_map
return {
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("trouble").setup()
			trouble_map()
		end,
	},
}
