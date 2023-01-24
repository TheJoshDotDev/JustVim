local M = {}
M.setup = function()
	local null_ls = require("null-ls")
	local formatters = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		sources = {
			formatters.stylua.with({
				condition = function(utils)
					return utils.root_has_file(".stylua.toml")
				end,
			}),
			formatters.prettier.with({
				condition = function(utils)
					return utils.root_has_file(".prettierrc")
				end,
			}),
			-- promises performance benefits
			diagnostics.eslint_d.with({
				condition = function(utils)
					return utils.root_has_file(".eslintrc.js")
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
