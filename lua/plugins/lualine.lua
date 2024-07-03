return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			section_separators = "",
			component_separators = "",
		},
		winbar = {
			lualine_a = {
				{
					"filetype",
					colored = false, -- Displays filetype icon in color if set to true
					icon_only = true, -- Display only an icon for filetype
				},
			},
			lualine_b = {
				{
					"filename",
					file_status = false,
					newfile_status = false,
					symbols = {
						unnamed = "",
					},
				},
			},
			lualine_c = {
				{
					"filename",
					path = 1,
					shorting_target = 40,
					symbols = {
						modified = "",
						unnamed = "",
						newfile = "[New]",
					},
				},
			},
		},
		inactive_winbar = {
			lualine_c = {
				{
					"filetype",
					colored = true,
					icon_only = true,
				},
				{
					"filename",
					file_status = false,
					newfile_status = false,
					symbols = {
						unnamed = "",
					},
				},
			},
		},
	},
}
