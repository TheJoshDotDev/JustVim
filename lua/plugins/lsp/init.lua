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

		local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

		if not cmp_nvim_lsp_status then
			vim.notify("CMP Nvim LSP not found", vim.log.levels.ERROR)
		end

		local null_ls_status, null_ls = pcall(require, "null-ls")

		if not null_ls_status then
			vim.notify("Null LS not found", vim.log.levels.ERROR)
		end

		local autocmds = require("plugins.lsp.autocmds")
		local servers = require("plugins.lsp.servers")

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local lsp = vim.lsp

		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"angularls",
				"gopls",
				"cssls",
				"html",
				"tailwindcss",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["tailwindcss"] = servers.setupTwindLs,
				["lua_ls"] = servers.setupLuaLs,
			},
		})

		servers.setupDartLs(capabilities)

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"eslint_d",
				"prettierd",
			},
			automatic_installation = false,
		})

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			sources = {
				formatting.prettierd.with({
					condition = function(utls)
						return utls.root_has_file({ ".prettierrc.json", ".prettierrc" })
					end,
				}),
				formatting.stylua,
				diagnostics.eslint_d.with({
					condition = function(utls)
						return utls.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
					end,
				}),
			},

			on_attach = function(current_client, bufnr)
				autocmds.organizeTypescriptImports()
				autocmds.formatOnSave(current_client, bufnr)
			end,
		})

		vim.diagnostic.config({
			virtual_text = true,
			float = {
				border = "rounded",
			},
		})

		lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})
		lsp.handlers["textDocument/signatureHelp"] = lsp.with(vim.lsp.handlers.signatureHelp, {
			border = "rounded",
		})

		local lsp_window_ui_state, lsp_window_ui = pcall(require, "lspconfig.ui.windows")
		if lsp_window_ui_state then
			lsp_window_ui.default_options.border = "rounded"
		end
	end,
}
