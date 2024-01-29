return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<C-t>T", function()
			require("trouble").toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<C-t>t", function()
			require("trouble").toggle("document_diagnostics")
		end)
	end,
}
