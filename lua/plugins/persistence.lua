return {
	"folke/persistence.nvim",

	keys = {
		{
			"<leader>ls",
			'<cmd>lua require("persistence").load()<cr>',
		},
	},

	config = function()
		local keymap = vim.keymap

		local persistence_ok, persistence = pcall(require, "persistence")
		if not persistence_ok then
			vim.notify("persistence.nvim not found", vim.log.levels.ERROR)
		end

		persistence.setup()

		keymap.set("n", "<leader>ls", function()
			persistence.load({ last = true })
		end)

		keymap.set("n", "<leader>ls", function()
			vim.notify("󰞶 Loading last session...", vim.log.levels.INFO)
			persistence.load()
			vim.notify(" Last session loaded", vim.log.levels.INFO)
		end, { noremap = true, silent = true, desc = "Load last session" })
	end,
}
