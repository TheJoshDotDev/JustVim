return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local noice_ok, noice = pcall(require, "noice")
		if not noice_ok then
			vim.notify("Noice not found", vim.log.levels.ERROR)
		end

		noice.setup({
			presets = {
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		})
	end,
}
