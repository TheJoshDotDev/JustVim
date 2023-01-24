local M = {}
M.setup = function()
	local null_ls = require("null-ls")
	local formatters = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		sources = {
			formatters.stylua,
			formatters.prettier.with({
				condition = function(utils)
					return utils.root_has_file(".prettierrc.json")
				end,
			}),
			diagnostics.eslint_d.with({
				condition = function(utils)
					return utils.root_has_file(".eslintrc.json")
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
