return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments_ok, todo_comments = pcall(require, "todo-comments")
		if not todo_comments_ok then
			vim.notify("Todo comments not found", vim.log.levels.ERROR)
		end

		todo_comments.setup()
		vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true })
	end,
}
