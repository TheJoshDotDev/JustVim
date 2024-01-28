local G = {}

local lspconfig = require("lspconfig")

function G.setupLuaLs()
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
end

function G.setupDartLs(capabilities)
	lspconfig["dartls"].setup({
		cmd = { "dart", "language-server", "--protocol=lsp" },
		capabilities = capabilities,
	})
end

return G
