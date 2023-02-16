-- OTPIONS
local symbols_outline_opts = require("plugins.editor.symbols-outline.opts")
local indent_blankline_opts = require("plugins.editor.blankline.opts")

-- KEYS
local todo_comments_keys = require("plugins.editor.todo-comments.keys")
local vim_maximizer_keys = require("plugins.editor.vim-maximizer.keys")
local symbols_outline_keys = require("plugins.editor.symbols-outline.keys")

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = indent_blankline_opts,
	},
	{
		"simrat39/symbols-outline.nvim",
		keys = symbols_outline_keys,
		opts = symbols_outline_opts,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = todo_comments_keys,
		config = true,
	},
	{
		"szw/vim-maximizer",
		keys = vim_maximizer_keys,
	},
	{
		"m4xshen/autoclose.nvim",
		config = true,
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	{
		"christoomey/vim-tmux-navigator",
	},
}
