local keymap = vim.keymap
local M = {}

M.nvimtree_keys = function()
	keymap.set("n", "<leader>ne", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer Nvim Tree Toggle (cwd)", remap = true })
	keymap.set("n", "<leader>nf", "<cmd>NvimTreeFocus<cr>", { desc = "Focus Nvim Tree Toggle (cwd)", remap = true })
	keymap.set("n", "<leader>nr", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh Nvim Tree Toggle (cwd)", remap = true })
end

return M
