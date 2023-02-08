return {
		"navarasu/onedark.nvim",
		name = "onedark",
		priority = 60,
		config = function()
			local colorscheme = "onedark"
			local onedark = require(colorscheme)

			onedark.setup({
					style = 'cool',
					lualine = {
							transparent = true
					}
			})

			onedark.load()
		end,
}
