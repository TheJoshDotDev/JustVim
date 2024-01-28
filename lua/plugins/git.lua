return {
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cond = function()
			local output = vim.fn.systemlist("git rev-parse --is-inside-work-tree 2>/dev/null")
			return #output ~= 0
		end,
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "▎" },
					topdelete = { text = "▎" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				on_attach = function(bufnr)
					vim.keymap.set(
						"n",
						"<leader>gp",
						require("gitsigns").prev_hunk,
						{ buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
					)
					vim.keymap.set(
						"n",
						"<leader>gn",
						require("gitsigns").next_hunk,
						{ buffer = bufnr, desc = "[G]o to [N]ext Hunk" }
					)
					vim.keymap.set(
						"n",
						"<leader>ph",
						require("gitsigns").preview_hunk,
						{ buffer = bufnr, desc = "[P]review [H]unk" }
					)

					vim.keymap.set("n", "<leader>gt", require("gitsigns").toggle_current_line_blame)
				end,
			})
		end,
	},
}
