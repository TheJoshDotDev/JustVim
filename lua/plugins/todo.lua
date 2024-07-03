return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments_ok, todo_comments = pcall(require, "todo-comments")
		if not todo_comments_ok then
			vim.notify("Todo comments not found", vim.log.levels.ERROR)
		end

		todo_comments.setup({
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				},
				TODO = { icon = " ", color = "info" },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			highlight = {
				before = "",
				keyword = "fg",
				after = "",
				comments_only = true,
				max_line_len = 400,
				exclude = {},
			},
		})

		vim.keymap.set("n", "<leader>to", "<cmd>TodoQuickFix<cr>", { desc = "Open todo quick fix list" })
		vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Open todo quick fix list" })
	end,
}
