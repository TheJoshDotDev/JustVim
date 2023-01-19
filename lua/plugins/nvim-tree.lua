local nvim_tree_config = require("configs.nvim-tree")

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	keys = {
		{ "<leader>ne", "<cmd>NvimTreeToggle<cr>", desc = "Explorer Nvim Tree Toggle (cwd)", remap = true },
		{ "<leader>nr", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh Nvim Tree Toggle (cwd)", remap = true },
	},
	opts = {
		-- change folder arrow icons
		view = {
			width = 40,
			hide_root_folder = true,
			side = "left",
			relativenumber = true,
			mappings = {
				list = {
					{
						key = "ga",
						action = "Add or remove file from git staging",
						action_cb = nvim_tree_config.git_add,
					},
				},
			},
		},
		renderer = {
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "", -- arrow when folder is closed
						arrow_open = "", -- arrow when folder is open
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
	},
	configs = function()
		nvim_tree_config.new_file_auto_open()
	end,
}
