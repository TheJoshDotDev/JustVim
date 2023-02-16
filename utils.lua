local M = {}

M.create_keymaps = function(keymaps, bufnr)
	for _, value in ipairs(keymaps) do
		local mode = value[1]
		local map = value[2]
		local cmd = value[3]

		local opts = { buffer = bufnr, remap = false }
		vim.keymap.set(mode, map, cmd, opts)
	end
end

return M
