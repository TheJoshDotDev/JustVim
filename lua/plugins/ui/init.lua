local lualine_opts = require("plugins.ui.config.opts").lualine_opts
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
								offsets = {
										{
												filetype = "NvimTree",
												text = "File Explorer",
												highlight = "Directory",
												separator = true
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
