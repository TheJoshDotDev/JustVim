return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local blankline_ok, blankline = pcall(require, "ibl")
		if not blankline_ok then
			vim.notify("Indent blankline not found", vim.log.levels.ERROR)
		end

		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#5D4556" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#615B5A" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#614F50" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#4F5C57" })

		vim.api.nvim_set_hl(0, "ActiveRed", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "ActiveYellow", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "ActiveOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "ActiveGreen", { fg = "#98C379" })

		blankline.setup({
			indent = {
				char = "▏",
				highlight = { "RainbowRed", "RainbowOrange", "RainbowYellow", "RainbowOrange" },
				smart_indent_cap = true,
				repeat_linebreak = false,
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = false,
				injected_languages = false,
				highlight = { "ActiveRed", "ActiveOrange", "ActiveYellow", "ActiveOrange" },
			},
		})
	end,
}
