local M = {}

M.trouble_map = function()
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
	vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
	vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
end

return M
