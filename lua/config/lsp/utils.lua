local M = {}

M.on_attach = function(client, bufnr)
	require('lsp-zero').on_attach(client, bufnr)
	require('lsp-zero').buffer_autoformat()
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end

	vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = bufnr })
end

return M
