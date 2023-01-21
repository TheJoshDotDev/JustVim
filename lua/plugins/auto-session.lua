return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>ss", "<cmd>SaveSession<cr>", desc = "Saves the current session" },
	},
	config = function()
		require("auto-session").setup({
			log_level = "error",
		})
	end,
}
