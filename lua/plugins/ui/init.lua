local lualine_opts = require("plugins.ui.config.opts").lualine_opts
return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "tabs",
				separator_style = "thick",
			},
		},
	},
	"SmiteshP/nvim-navic",
	{
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = lualine_opts,
	}
}
