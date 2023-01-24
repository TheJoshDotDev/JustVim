local M = {}

M.lualine_opts = {
	options = {
		theme = vim.g.colorscheme,
		component_separators = "|",
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "mode", right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = {
			{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
			{ require("auto-session-library").current_session_name },
			{
				function()
					return require("nvim-navic").get_location()
				end,
				cond = function()
					return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
				end,
			},
		},

		lualine_x = { "fileformat" },
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {
			{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
		},
		lualine_c = {
			{ require("auto-session-library").current_session_name },
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = { "nvim-tree" },
}

return M
