local G = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function G.formatOnSave(current_client, bufnr)
	if current_client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end
end

function G.organizeTypescriptImports()
	vim.api.nvim_create_autocmd({ "BufWritePre" }, {
		group = augroup,
		pattern = { "*.ts*" },
		command = ":TSToolsFixAll",
	})
end

return G
