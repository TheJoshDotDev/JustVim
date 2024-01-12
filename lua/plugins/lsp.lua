return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Lsp
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Null ls
		{ "jay-babu/mason-null-ls.nvim" },
		{ "nvimtools/none-ls.nvim" },

		-- Completion
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		-- Pretty
		{ "onsails/lspkind.nvim" },
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "tsserver" },
			handlers = {
				-- Setup a handler for all installed servers
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		})

		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					maxwidth = 40,
					ellipsis_char = "...",
				}),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<Tab>"] = function(fallback)
					cmp.mapping.abort()
					local copilot_keys = vim.fn["copilot#Accept"]()
					if copilot_keys ~= "" then
						vim.api.nvim_feedkeys(copilot_keys, "i", true)
					else
						fallback()
					end
				end,
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		local null_ls = require("null-ls")

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"eslint_d",
			},
		})

		-- for conciseness
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local completion = null_ls.builtins.completion

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				formatting.stylua,
				formatting.prettierd,
				diagnostics.eslint_d,
				completion.spell,
			},

			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})

		vim.diagnostic.config({ virtual_text = true })
	end,
}
