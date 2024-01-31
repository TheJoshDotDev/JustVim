return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	conftig = function()
		local blankline_ok, blankline = pcall(require, "indent_blankline")
		if not blankline_ok then
			vim.notify("Indent blankline not found", vim.log.levels.ERROR)
		end
		blankline.setup({
			indent = {
				char = "│",
				tab_char = "│",
			},
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		})
	end,
}
