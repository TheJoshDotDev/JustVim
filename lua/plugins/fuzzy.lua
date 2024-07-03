return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "smartpde/telescope-recent-files" },
	},
	config = function()
		local telescope_ok, telescope = pcall(require, "telescope")
		if not telescope_ok then
			vim.notify("Telescope not found", vim.log.levels.ERROR)
		end

		local telescope_themes_ok, telescope_themes = pcall(require, "telescope.themes")
		if not telescope_themes_ok then
			vim.notify("Telescope themes not found", vim.log.levels.ERROR)
		end

		local telescope_builtins_ok, telescope_builtins = pcall(require, "telescope.builtin")
		if not telescope_builtins_ok then
			vim.notify("Telescope builtins not found", vim.log.levels.ERROR)
		end

		telescope.setup({
			defaults = {
				selection_caret = " ",
				layout_strategy = "vertical",
				sorting_strategy = "ascending",
				preview = false,
				layout_config = {
					height = 0.6,
					width = 0.5,
					prompt_position = "top",
				},

				-- mappings = {
				-- 	n = {
				-- 		["bd"] = require("telescope.actions").delete_buffer,
				-- 	}, -- n
				-- 	i = {
				-- 		["bd"] = require("telescope.actions").delete_buffer,
				-- 	},
				-- },
			},
			extensions = {
				["ui-select"] = {
					telescope_themes.get_dropdown({}),
				},
				recent_files = {
					only_cwd = true,
				},
			},
		})

		vim.keymap.set(
			"n",
			"<leader>ff",
			telescope_builtins.find_files,
			{ noremap = true, silent = true, desc = "Find files" }
		)
		vim.keymap.set("n", "<leader>sr", function()
			telescope.extensions.recent_files.pick()
		end, { noremap = true, silent = true, desc = "Open recent files" })
		vim.keymap.set(
			"n",
			"<leader>sg",
			telescope_builtins.live_grep,
			{ noremap = true, silent = true, desc = "Grep" }
		)
		vim.keymap.set(
			"n",
			"<leader>ss",
			telescope_builtins.grep_string,
			{ noremap = true, silent = true, desc = "Grep string" }
		)
		vim.keymap.set(
			"n",
			"<leader>sb",
			telescope_builtins.current_buffer_fuzzy_find,
			{ noremap = true, silent = true, desc = "Search current buffer" }
		)
		vim.keymap.set(
			"n",
			"<leader>fb",
			telescope_builtins.buffers,
			{ noremap = true, silent = true, desc = "Find buffers" }
		)

		-- help
		vim.keymap.set(
			"n",
			"<leader>sh",
			telescope_builtins.help_tags,
			{ noremap = true, silent = true, desc = "Help tags" }
		)
		vim.keymap.set(
			"n",
			"<leader>km",
			telescope_builtins.keymaps,
			{ noremap = true, silent = true, desc = "Keymaps" }
		)

		-- lsp
		-- use dropdown
		vim.keymap.set("n", "<leader>so", function()
			telescope_builtins.lsp_document_symbols({
				fname_width = 100,
				show_line = true,
				symbols = {
					"Class",
					"Function",
					"Method",
					"Field",
					"Constructor",
					"Enum",
					"Interface",
					"Module",
				},
			})
		end, { noremap = true, silent = true, desc = "Document symbols" })
		vim.keymap.set("n", "<leader>lr", function()
			telescope_builtins.lsp_references(require("telescope.themes").get_dropdown({}))
		end, { noremap = true, silent = true, desc = "LSP References" })
		vim.keymap.set("n", "<leader>ld", function()
			telescope_builtins.lsp_definitions({ jump_type = "never" })
		end, { noremap = true, silent = true, desc = "LSP Definitions" })

		vim.keymap.set("n", "<leader>li", function()
			telescope_builtins.lsp_implementations(require("telescope.themes").get_dropdown({}))
		end, { noremap = true, silent = true, desc = "LSP Implementations" })

		-- git
		vim.keymap.set("n", "<leader>gb", function()
			telescope_builtins.git_branches(require("telescope.themes").get_dropdown({}))
		end, { noremap = true, silent = true, desc = "Git branches" })
		vim.keymap.set(
			"n",
			"<leader>gc",
			telescope_builtins.git_commits,
			{ noremap = true, silent = true, desc = "Git commits" }
		)
		vim.keymap.set("n", "<leader>gs", function()
			telescope_builtins.git_status(require("telescope.themes").get_dropdown({}))
		end, { noremap = true, silent = true, desc = "Git status" })

		-- diagnostics
		vim.keymap.set("n", "<leader>dd", function()
			telescope_builtins.diagnostics({ bufnr = 0 })
		end, { noremap = true, silent = true, desc = "Document diagnostics" })

		vim.keymap.set(
			"n",
			"<leader>dD",
			telescope_builtins.diagnostics,
			{ noremap = true, silent = true, desc = "Document diagnostics" }
		)

		telescope.load_extension("recent_files")
		telescope.load_extension("fzf")
	end,
}
