vim.diagnostic.config({
	virtual_text = true,
	float = {
		border = "rounded",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
	border = "rounded",
})

local lsp_window_ui_ok, lsp_window_ui = pcall(require, "lspconfig.ui.windows")
if lsp_window_ui_ok then
	lsp_window_ui.default_options.border = "rounded"
end
