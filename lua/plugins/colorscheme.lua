return {
	"folke/tokyonight.nvim",
	priority = 60,
	config = function()
		local colorscheme = "tokyonight"
		local tokyonight = require(colorscheme)

		tokyonight.setup({
			style = "moon"
		})

		vim.g.colorscheme = colorscheme
		vim.cmd.colorscheme(colorscheme)
	end,
}
