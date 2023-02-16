return {
	"folke/tokyonight.nvim",
	name = "tokyonight",
	priority = 60,
	config = function()
		local colorscheme = "tokyonight"
		local tokyonight = require(colorscheme)

		tokyonight.setup({
			style = "night",
			styles = {
				floats = "normal",
			},
		})

		vim.cmd("colorscheme " .. colorscheme)
		vim.g.colorscheme = colorscheme
	end,
}
