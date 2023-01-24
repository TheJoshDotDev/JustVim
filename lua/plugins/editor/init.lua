return {
	"christoomey/vim-tmux-navigator",
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>wm", "<cmd>MaximizerToggle<cr>", desc = "Toggle maximize current window" },
		},
	},
	"tpope/vim-sleuth",
	{
		"m4xshen/autoclose.nvim",
		opts = {},
	},
	{
		"simrat39/symbols-outline.nvim",
		keys = {
			{ "<leader>so", "<cmd>SymbolsOutline<cr>", "Open file outline" },
		},
		opts = require("configs.symbols-outline"),
	},
	{
		"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
		event = "BufReadPre",
		opts = {
			-- char = "┊",
			char = "│",
			show_trailing_blankline_indent = true,
		},
	},
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
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "┊" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame = true,
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			current_line_blame_opts = {
				delay = 200,
				ignore_whitespace = true,
			},
		},
	}
}
