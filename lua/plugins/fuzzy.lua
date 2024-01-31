return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
		},
		{
			"<leader>rr",
			"<cmd>Telescope oldfiles <cr>",
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
		},
		{
			"<leader>sh",
			"<cmd>Telescope help_tags<cr>",
		},
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "ahmedkhalf/project.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "benfowler/telescope-luasnip.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
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

		telescope.setup({
			defaults = {
				prompt_prefix = "🔭 ",
				selection_caret = " ",
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = {
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

		vim.keymap.set("n", "<leader>sn", telescope.extensions.luasnip.luasnip)

		telescope.load_extension("noice")
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("luasnip")
	end,
}
