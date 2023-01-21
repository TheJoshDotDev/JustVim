return {
	"catppuccin/nvim",
	priority = 60,
	config = function()
		local colorscheme = "catppuccin"
		local ok, catpuccin = pcall(require, colorscheme)
		if not ok then
			return
		end
		catpuccin.setup({
			flavour = "mocha",
			transparent_background = true,
			styles = {
				keywords = { "bold" },
				properties = { "bold" },
				comments = { "italic" },
			},
			custom_highlights = function(colors)
				return {
					Comment = { fg = colors.flamingo },
				}
			end,
			integrations = {
				nvimtree = false,
			},
			indent_blankline = {
				colored_indent_levels = true,
			},
		})

		vim.g.colorscheme = colorscheme
		vim.cmd.colorscheme(colorscheme)
	end,
}
