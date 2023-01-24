local M = {}

M.nvimtree_opts = {
	-- change folder arrow icons
	view = {
		width = 40,
		hide_root_folder = true,
		side = "left",
		number = true,
		relativenumber = true,
		mappings = {
			list = {
				{
					key = "ga",
					action = "Add or remove file from git staging",
					-- action_cb = nvim_tree_config.git_add,
				},
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "",
					deleted = "",
					ignored = "",
				},
			},
		},
	},
	update_focused_file = {
		enable = true,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
}

return M
