return {
	"EdenEast/nightfox.nvim",
	priority = 60,
	config = function()
		local colorscheme = "nightfox"
		local ok, nightfox = pcall(require, colorscheme)
		if not ok then
			return
		end
		nightfox.setup({
			options = {
				transparent = true,
				styles = {
					comments = "bold",
				},
			},
		})

		vim.g.colorscheme = colorscheme
		vim.cmd.colorscheme(colorscheme)
	end,
}
