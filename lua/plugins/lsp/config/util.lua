local M = {}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_buffer_keymaps = require("plugins.lsp.config.keymaps").lsp_buffer_keymaps

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
	vim.api.nvim_create_autocmd("BufWritePost", {
		callback = function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					if vim.bo.filetype == "javascript" then
						return client.name == "null-ls"
					end
					if vim.bo.filetype == "lua" then
						return client.name == "null-ls"
					end
					return true
				end,
			})
		end,
	})
end
return M
