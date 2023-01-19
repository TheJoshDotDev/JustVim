local M = {}

local keymap = vim.keymap

M.telescope_keymaps = function()
	keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
	keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
	keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
	keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

	keymap.set(
		"n",
		"<leader>gm",
		"<cmd>Telescope git_commits<cr>",
		{ desc = "list all git commits (use <cr> to checkout) ['gc' for git commits]" }
	)
	keymap.set(
		"n",
		"<leader>gfc",
		"<cmd>Telescope git_bcommits<cr>",
		{ desc = 'list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]' }
	)
	keymap.set(
		"n",
		"<leader>gb",
		"<cmd>Telescope git_branches<cr>",
		{ desc = "list git branches (use <cr> to checkout) ['gb' for git branch]" }
	)
	keymap.set(
		"n",
		"<leader>gs",
		"<cmd>Telescope git_status<cr>",
		{ desc = "list current changes per file with diff preview ['gs' for git status]" }
	)

	-- restart lsp server (not on youtube nvim video)
	keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
end

return M
