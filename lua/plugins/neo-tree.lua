return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree<cr>", desc = "LazyGit" },
	},
	config = function()
		local ok, neo_tree = pcall(require, "neo-tree")
		if not ok then
			vim.notify("Neo Tree was not found")
		end

		neo_tree.setup({
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
