local G = {}

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	vim.notify("Lspconfig not found", vim.log.levels.ERROR)
end
local util = lspconfig.util

function G.LuaLs(capabilities)
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
			},
		},
	})
end

function G.DartLs(capabilities)
	lspconfig["dartls"].setup({
		cmd = { "dart", "language-server", "--protocol=lsp" },
		capabilities = capabilities,
	})
end

function G.TwindLs(capabilities)
	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
		single_file_support = false,
		root_dir = util.root_pattern("tailwind.*"),
	})
end

return G
