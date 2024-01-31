return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = true,
			term_colors = true,
			integrations = {
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
			},
			color_overrides = {
				all = {
					text = "#C3BAC6",
				},
			},
			custom_highlights = function(colors)
				return {
					CmpBorder = { fg = colors.surface2 },
					Pmenu = { bg = colors.none },
					IncSearch = { bg = colors.none },

					CursorLine = { bg = colors.mantle },
					StatusLine = { bg = colors.mantle, fg = colors.rose },

					WinBar = { bg = colors.none, fg = colors.teal },
					WinBarNC = { bg = colors.none, fg = colors.crust },

					FloatBorder = { fg = colors.teal },
					IblScope = { fg = colors.pink },
				}
			end,
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
