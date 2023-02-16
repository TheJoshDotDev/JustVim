local neogen_config = require("plugins.documentation.neogen.config")
return {
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = neogen_config,
	},
}
