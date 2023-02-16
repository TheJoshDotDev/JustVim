local lualine_config = require("plugins.ui.lualine.config")

return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "tabs",
				separator_style = "thick",
				tab_size = 23,
				show_close_icon = false,
			},
		},
	},
	{
		"SmiteshP/nvim-navic", -- Navigation indicator
	},
	{
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"SmiteshP/nvim-navic",
		},
		config = lualine_config,
	},
}
