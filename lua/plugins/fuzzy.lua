return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ahmedkhalf/project.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>rr", "<cmd>Telescope oldfiles<cr>" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		local themes = require("telescope.themes")

		-- files
		vim.keymap.set("n", "<leader>rr", builtin.oldfiles)
		vim.keymap.set("n", "<leader>fb", builtin.buffers)
		vim.keymap.set("n", "<leader>sg", builtin.grep_string)
		vim.keymap.set("n", "<leader>so", builtin.current_buffer_fuzzy_find)

		-- diagnostics

		-- doesnt work
		vim.keymap.set("n", "<leader>dd", builtin.lsp_type_definitions)

		vim.keymap.set("n", "<leader>sb", builtin.lsp_document_symbols)
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions)
		vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations)
		vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions)

		-- help
		vim.keymap.set("n", "<leader>sh", builtin.help_tags)

		-- git
		vim.keymap.set("n", "<leader>gb", builtin.git_branches)
		vim.keymap.set("n", "<leader>gc", builtin.git_commits)
		vim.keymap.set("n", "<leader>gs", builtin.git_status)

		telescope.setup({
			defaults = {
				prompt_prefix = "🔭 ",
				selection_caret = " ",
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = {
					height = 0.85,
					width = 0.9,
					prompt_position = "top",
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
