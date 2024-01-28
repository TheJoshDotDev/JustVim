return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "ahmedkhalf/project.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "benfowler/telescope-luasnip.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},

	config = function()
		local telescope = require("telescope")

		local themes = require("telescope.themes")

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
					themes.get_dropdown({}),
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>fg", builtin.live_grep)
		vim.keymap.set("n", "<leader>ff", builtin.find_files)

		-- files
		vim.keymap.set("n", "<leader>rr", builtin.oldfiles)
		vim.keymap.set("n", "<leader>fb", builtin.buffers)
		vim.keymap.set("n", "<leader>sg", builtin.grep_string)
		vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find)
		vim.keymap.set("n", "<leader>so", builtin.lsp_document_symbols)

		vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
		vim.keymap.set("n", "<leader>gd", function()
			builtin.lsp_definitions({ jump_type = "never" })
		end)
		vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations)
		vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions)

		-- help
		vim.keymap.set("n", "<leader>sh", builtin.help_tags)

		-- git
		vim.keymap.set("n", "<leader>gb", builtin.git_branches)
		vim.keymap.set("n", "<leader>gc", builtin.git_commits)
		vim.keymap.set("n", "<leader>gs", builtin.git_status)

		vim.keymap.set("n", "<leader>sn", telescope.extensions.luasnip.luasnip)

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("luasnip")
	end,
}
