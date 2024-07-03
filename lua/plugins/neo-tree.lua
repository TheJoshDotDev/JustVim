return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree position=float reveal=true<cr>", desc = "LazyGit" },
	},
	config = function()
		local ok, neo_tree = pcall(require, "neo-tree")
		if not ok then
			vim.notify("Neo Tree was not found")
		end

		neo_tree.setup({
			filesystem = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
				},
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = true,
			},
			window = {
				mappings = {
					["<space>"] = {
						"toggle_node",
						nowait = true,
					},
				},
			},
		})
	end,
}
