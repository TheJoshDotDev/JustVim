local keymap = vim.keymap
local M = {}

M.telescope_keymaps = function()
	keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "search files (cwd)" })
	keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "search string in (cwd)" })
	keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "search file buffers" })
	keymap.set("n", "<leader>fr",
		[[<cmd>lua require("telescope").extensions.recent_files.pick()<cr>]], 
		{ desc = "search recent file in current session" })

	keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "find help" })

	keymap.set("n", "<C-g>g", require("telescope.builtin").git_commits, { desc = "search git commit" })
	keymap.set("n", "<C-g>b", require("telescope.builtin").git_branches, { desc = "search git branches" })
	keymap.set("n", "<leader>rs", ":LspRestart<CR>")
end

return M
