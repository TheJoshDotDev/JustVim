local M = {}

local keymap = vim.keymap

s.telescope_keymaps = function()
	keymap.set("n", "<leader>rs", ":LspRestart<CR>")
end

return M
