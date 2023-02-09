local M = {}
local lsp_util = require("plugins.lsp.config.util")

M.setup = function()
	local null_ls = require("null-ls")
	local formatters = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		on_attach = lsp_util.autofmt_on_save,
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
		ensure_installed = {
			"eslint_d",
			"prettier",
			"stylua",
		},
		automatic_installtion = true,
		automatic_setup = false,
	})

	vim.diagnostic.config({
		virtual_text = false,
	})
end

return M
