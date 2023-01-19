return {
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- "gc" to comment visual regions/lines
	"numToStr/Comment.nvim",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",




  -- UTILITY
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
	-- vscode like icons in autocompletion
	"onsails/lspkind.nvim",
	-- Add vscode like icons to nvim
	"nvim-tree/nvim-web-devicons",
  -- Animated indent line
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "BufReadPre",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
}
