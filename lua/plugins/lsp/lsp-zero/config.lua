local null_ls_config = require("plugins.lsp.null-ls.config")
local lsp_autocmds = require("plugins.lsp.autocmd")
local language_servers = require("plugins.lsp.lsp-zero.const").servers

return function()
	local lsp = require("lsp-zero")

	lsp.preset("recommended")
	lsp.ensure_installed(language_servers)

	lsp.configure("sumneko_lua", {
		settings = {
			Lua = {
				format = {
					defaultConfig = {
						indent_style = "space",
						indent_size = "1",
					},
				},
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})

	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	local cmp_mappings = lsp.defaults.cmp_mappings({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	})

	cmp_mappings["<Tab>"] = nil
	cmp_mappings["<S-Tab>"] = nil
	local lspkind = require("lspkind")
	lsp.setup_nvim_cmp({
		mapping = cmp_mappings,
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},
	})

	lsp.on_attach(function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end
		lsp_autocmds.autofmt_on_save(client, bufnr)
	end)

	lsp.setup()

	null_ls_config()
end
