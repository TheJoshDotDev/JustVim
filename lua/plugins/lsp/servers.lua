local G = {}

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	vim.notify("Lspconfig not found", vim.log.levels.ERROR)
end
local util = lspconfig.util

function G.setupLuaLs()
	lspconfig.lua_ls.setup({
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

function G.setupDartLs(capabilities)
	lspconfig["dartls"].setup({
		cmd = { "dart", "language-server", "--protocol=lsp" },
		capabilities = capabilities,
	})
end

function G.setupTwindLs()
	lspconfig.tailwindcss.setup({
		single_file_support = false,
		root_dir = util.root_pattern("tailwind.*"),
	})
end

return G
