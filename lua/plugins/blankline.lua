return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local blankline_ok, blankline = pcall(require, "ibl")
		if not blankline_ok then
			vim.notify("Indent blankline not found", vim.log.levels.ERROR)
		end

		vim.api.nvim_set_hl(0, "Blankline", { fg = "#2f324a" })

		blankline.setup({
			indent = {
				char = "│",
				tab_char = "│",
				highlight = {
					"Blankline",
				},
			},
			scope = {
				enabled = false,
			},
		})
	end,
}
