local telescope_opts = require("plugins.fuzzy-search.config.opts").telescope_opts
local telescope_setup = require("plugins.fuzzy-search.config.telescope")

return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"smartpde/telescope-recent-files",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1
			},
			"tsakirist/telescope-lazy.nvim",
		},
		opts = telescope_opts,
		config = telescope_setup.setup,
	},
}
