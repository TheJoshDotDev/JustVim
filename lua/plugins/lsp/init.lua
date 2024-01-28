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
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local autocmds = require("plugins.lsp.autocmds")
		local servers = require("plugins.lsp.servers")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local null_ls = require("null-ls")

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
		})

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			sources = {
				formatting.prettierd,
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

		require("lspconfig.ui.windows").default_options.border = "rounded"
	end,
}
