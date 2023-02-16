local neogen_keys = require("plugins.documentation.neogen.keys")
local neogen_config = require("plugins.documentation.neogen.config")

return {
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		keys = neogen_keys,
		config = neogen_config,
	},
}
