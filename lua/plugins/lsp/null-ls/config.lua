local lsp_autocmds = require("plugins.lsp.autocmd")
local servers = require("plugins.lsp.null-ls.const").servers

return function()
	local null_ls = require("null-ls")
	local formatters = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	-- TODO: Refactor to use server list constant
	null_ls.setup({
		on_attach = lsp_autocmds.autofmt_on_save,
		sources = {
			diagnostics.eslint_d.with({
				condition = function(utils)
					return utils.root_has_file(".eslintrc.json")
				end,
			}),
			formatters.prettierd,
			formatters.stylua,
		},
	})

	require("mason-null-ls").setup({
		ensure_installed = servers,
		automatic_installtion = true,
		automatic_setup = false,
	})

	vim.diagnostic.config({
		virtual_text = false,
	})
end
