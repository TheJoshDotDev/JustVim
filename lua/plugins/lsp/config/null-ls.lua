local M = {}
M.setup = function()
	local null_ls = require("null-ls")
	local formatters = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		on_attach = function(current_client, bufnr)
			if current_client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						print("Formatting...")
						vim.lsp.buf.format({
							filter = function(client)
								--  only use null-ls for formatting instead of lsp server
								return client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end,
				})
			end
		end,
		sources = {
			formatters.stylua,
			formatters.prettier.with({
				condition = function(utils)
					return utils.root_has_file(".prettierrc.json")
				end,
			}),
		},
	})

	require("mason-null-ls").setup({
		ensure_installed = {
			"eslint_d",
			"stylua",
			"prettier"
		},
		automatic_installtion = true,
		automatic_setup = false,
	})

	vim.diagnostic.config({
		virtual_text = true,
	})
end

return M
