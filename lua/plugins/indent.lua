local symbol = "│"

return {
	{
		"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
		event = "BufReadPre",
		opts = {
			-- char = "┊",
			char = symbol,
			show_trailing_blankline_indent = true,
		},
	},
	-- COSMETICS
	-- Animated indent line
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "BufReadPre",
		opts = {
			symbol = symbol,
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "nvimtree" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
}
