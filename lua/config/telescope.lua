local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fd', function()
	builtin.diagnostics({ bufnr = 0 })
end)
vim.keymap.set('n', '<leader>so', function()
	builtin.lsp_document_symbols()
end)


require('telescope').setup({
	defaults = {
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		layout_config = {
			height = 0.7,
			width = 0.6,
			prompt_position = "top",
		},
	},
})
