return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "BufReadPre",
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
		local cmp_ok, cmp = pcall(require, "cmp")
		if not cmp_ok then
			vim.notify("Nvim Cmp not found", vim.log.levels.ERROR)
		end

		local luasnip_ok, luasnip = pcall(require, "luasnip")
		if not luasnip_ok then
			vim.notify("LuaSnip not found", vim.log.levels.ERROR)
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			performance = {
				max_view_entries = 20,
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			formatting = {
				format = function(_, item)
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
				["<C-j>"] = cmp.mapping(function(fallback)
					local copilot_keys = vim.fn["copilot#Accept"]()
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif copilot_keys ~= "" and type(copilot_keys) == "string" then
						vim.api.nvim_feedkeys(copilot_keys, "i", true)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),
		})

		require("luasnip").filetype_extend("typescriptreact", { "html" })

		require("luasnip.loaders.from_vscode").load({
			paths = { "./custom-snips/angular" },
		})

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
