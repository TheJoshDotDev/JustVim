return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"tsakirist/telescope-lazy.nvim",
			-- view lazy plugins with telescope
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
		},
		opts = {
			defaults = {
				file_ignore_patterns = { "node_modules", ".git", ".cache" },
				prompt_prefix = " ",
				selection_caret = "﬌ ",
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
			},
		},
		config = function(_, opts)
			local ok, telescope = pcall(require, "telescope")
			if not ok then
				return
			end
			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("lazy")
			require("configs.plugin-keymaps").telescope_keymaps()
		end,
	},
}
