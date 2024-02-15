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

		local servers = require("plugins.lsp.servers")
		local autocmd = vim.api.nvim_create_autocmd
		local keymap = vim.keymap

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
				"tsserver",
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
			on_attach = function(_, bufnr)
				vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
					command = "w",
					buffer = bufnr,
					nested = true,
				})
			end,
		})

		keymap.set("n", "<leader>fo", function()
			local clients = vim.lsp.get_active_clients()

			local current_client = clients[1]

			if current_client.supports_method("textDocument/formatting") then
				vim.lsp.buf.format({
					async = true,
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = 0,
				})
				vim.cmd("wa")
			else
				vim.notify("The current client does not support formatting")
			end
		end, { desc = "Formats the current buffer" })

		local lspGroup = vim.api.nvim_create_augroup("LspFormatting", {})
		autocmd("LspAttach", {
			group = lspGroup,
			callback = function()
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show hover" })
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
				vim.keymap.set(
					"n",
					"gi",
					"<cmd>lua vim.lsp.buf.implementation()<cr>",
					{ desc = "Go to implementation" }
				)
				vim.keymap.set(
					"n",
					"go",
					"<cmd>lua vim.lsp.buf.type_definition()<cr>",
					{ desc = "Go to type definition" }
				)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Go to references" })
				vim.keymap.set("n", "sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Show signature help" })
				vim.keymap.set("n", "rr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
				vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })
				vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Show diagnostics" })
				vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
				vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
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
