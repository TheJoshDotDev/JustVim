local lualine_opts = require("plugins.ui.config.opts").lualine_opts
return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "tabs",
				separator_style = "thick",

				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true -- use a "true" to enable the default, or set your own character
					}
				}
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
