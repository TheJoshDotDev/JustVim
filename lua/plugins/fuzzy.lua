return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "folke/noice.nvim" },
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

		-- add icons to telescope

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
				mappings = {
					n = {
						["bd"] = require("telescope.actions").delete_buffer,
					}, -- n
					i = {
						["bd"] = require("telescope.actions").delete_buffer,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					telescope_themes.get_dropdown({}),
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", telescope_builtins.find_files)
		vim.keymap.set("n", "<leader>rr", telescope_builtins.oldfiles)
		vim.keymap.set("n", "<leader>fg", telescope_builtins.live_grep)
		vim.keymap.set("n", "<leader>sh", telescope_builtins.help_tags)

		-- files
		vim.keymap.set("n", "<leader>fb", telescope_builtins.buffers)
		vim.keymap.set("n", "<leader>sg", telescope_builtins.grep_string)
		vim.keymap.set("n", "<leader>sb", telescope_builtins.current_buffer_fuzzy_find)
		vim.keymap.set("n", "<leader>so", telescope_builtins.lsp_document_symbols)

		vim.keymap.set("n", "<leader>gr", telescope_builtins.lsp_references)
		vim.keymap.set("n", "<leader>gd", function()
			telescope_builtins.lsp_definitions({ jump_type = "never" })
		end)
		vim.keymap.set("n", "<leader>gi", telescope_builtins.lsp_implementations)
		vim.keymap.set("n", "<leader>gt", telescope_builtins.lsp_type_definitions)

		-- git
		vim.keymap.set("n", "<leader>gb", telescope_builtins.git_branches)
		vim.keymap.set("n", "<leader>gc", telescope_builtins.git_commits)
		vim.keymap.set("n", "<leader>gs", telescope_builtins.git_status)

		telescope.load_extension("fzf")
	end,
}
