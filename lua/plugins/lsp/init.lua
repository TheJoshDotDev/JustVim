return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		{ "hrsh7th/cmp-nvim-lsp" },

		{ "jay-babu/mason-null-ls.nvim" },
		{ "nvimtools/none-ls.nvim" },
	},
	config = function()
		local mason_status, mason = pcall(require, "mason")

		if not mason_status then
			vim.notify("Mason not found", vim.log.levels.ERROR)
		end

		local mason_lspconf_status, mason_lspconfig = pcall(require, "mason-lspconfig")

		if not mason_lspconf_status then
			vim.notify("Mason LSP Config not found", vim.log.levels.ERROR)
		end

		local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
		if not mason_null_ls_ok then
			vim.notify("Mason Null Ls not found", vim.log.levels.ERROR)
		end

		local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

		if not cmp_nvim_lsp_status then
			vim.notify("CMP Nvim LSP not found", vim.log.levels.ERROR)
		end

		local null_ls_status, null_ls = pcall(require, "null-ls")

		if not null_ls_status then
			vim.notify("Null LS not found", vim.log.levels.ERROR)
		end

		local servers = require("plugins.lsp.servers")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls", -- LUA
				"angularls", -- ANGULAR
				"gopls", -- GO
				"cssls", -- CSS
				"html", -- HTML
				"tailwindcss", -- TWIND
				"eslint", -- ESLINT
				"tsserver", -- TYPESCRIPT
			},
		})
		mason_lspconfig.setup_handlers({
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["tailwindcss"] = servers.TwindLs(capabilities),
			["lua_ls"] = servers.LuaLs(capabilities),
		})
		servers.DartLs(capabilities)

		mason_null_ls.setup({
			ensure_installed = {
				"prettier",
				"gofumpt",
				"goimports-reviser",
				"golines",
			},

			automatic_installation = false,
			hanlders = {},
		})

		local formatting = null_ls.builtins.formatting
		null_ls.setup({
			sources = {
				formatting.prettier.with({
					condition = function(utls)
						return utls.root_has_file({ ".prettierrc.json", ".prettierrc" })
					end,
				}),
				formatting.gofumpt,
				formatting.goimports_reviser,
				formatting.golines,
			},
		})

		require("plugins.lsp.autocmd")

		vim.diagnostic.config({
			virtual_text = true,
			float = {
				border = "rounded",
			},
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
			border = "rounded",
		})

		local lsp_window_ui_ok, lsp_window_ui = pcall(require, "lspconfig.ui.windows")
		if lsp_window_ui_ok then
			lsp_window_ui.default_options.border = "rounded"
		end
	end,
}
