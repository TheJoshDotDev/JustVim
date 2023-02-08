local M = {}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_buffer_keymaps = require("plugins.lsp.config.keymaps").lsp_buffer_keymaps

							local no_format_servers = {
								"tsserver",
							}

-- Adds an auto command to format the current buffer automatically on save
---@param current_client table
---@param bufnr number
---@return nil
M.autofmt_on_save = function(current_client, bufnr)
	if not current_client.supports_method("textDocument/formatting") then
		return
	end

	lsp_buffer_keymaps(bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({
						async = true,
						filter = function(client)
							return not vim.tbl_contains(no_format_servers, client.name)
						end
				})
			end,
	})
end
return M
