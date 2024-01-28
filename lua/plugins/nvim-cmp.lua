return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			formatting = {
				format = function(_, item)
					print(item)
					return item
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = function(fallback)
					cmp.mapping.abort()
					local has_copilot, _ = pcall(require, "copilot")
					print(has_copilot)
					if not has_copilot then
						fallback()
					else
						local copilot_keys = vim.fn["copilot#Accept"]()
						if copilot_keys ~= "" then
							vim.api.nvim_feedkeys(copilot_keys, "i", true)
						else
							fallback()
						end
					end
				end,
			}),
		})

		require("luasnip.loaders.from_vscode").lazy_load({
			paths = { "~/.config/nvim/lua/plugins/custom-snips/angular" },
		})

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
