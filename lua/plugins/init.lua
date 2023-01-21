return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	{
		"m4xshen/autoclose.nvim",
		opts = {},
	},

	-- UTILITY
	"christoomey/vim-tmux-navigator",
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>wm", "<cmd>MaximizerToggle<cr>", desc = "Toggle maximize current window" },
		},
	},

	-- STATUS
	"SmiteshP/nvim-navic",

	-- DOCUMENTATION
	"folke/which-key.nvim",

	-- COSMETICS
	-- Animated indent line
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "BufReadPre",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "nvimtree" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
}
