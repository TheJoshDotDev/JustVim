return {
	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
	event = "BufReadPre",
	opts = {
		char = "┊",
		show_trailing_blankline_indent = false,
	},
}
