return function()
	local opts = { remap = false }
	vim.keymap.set("n", "<leader>ng", ":Neogen<cr>", opts)
end
