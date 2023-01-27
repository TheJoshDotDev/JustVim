return {
	"folke/tokyonight.nvim",
	priority = 60,
	config = function()
		local colorscheme = "tokyonight"
		local tokyonight = require(colorscheme)

		tokyonight.setup({
			style = "night",
			transparent = true,
			styles = {
				sidebars = "transparent"
			}
		})
		vim.g.colorscheme = colorscheme
		vim.cmd.colorscheme(colorscheme)
	end,
}
