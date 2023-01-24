local symbol_outline_opts = require("plugins.editor.config.opts").symbol_outline_opts
local indent_blankline_opts = require("plugins.editor.config.opts").indent_blankline_opts
local indentscope_opts = require("plugins.editor.config.opts").indentscope_opts

local indentscope_config = require("plugins.editor.config.indentscope")

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
		opts = symbol_outline_opts,
	},
	{
		"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
		event = "BufReadPre",
		opts = indent_blankline_opts,
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "BufReadPre",
		opts = indentscope_opts,
		config = indentscope_config.setup,
	},
}
