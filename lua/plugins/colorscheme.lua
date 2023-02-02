return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 60,
	config = function()
		local colorscheme = "catppuccin"
		local catppuccin = require(colorscheme)

		catppuccin.setup({
			flavour = "mocha",
			transparent_background = true,
			styles = {
        comments = { "italic" },
        conditionals = { "italic" },
			},
		})
		vim.g.colorscheme = colorscheme
		vim.cmd.colorscheme(colorscheme)
	end,
}
