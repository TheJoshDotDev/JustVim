local telescope = require('telescope')
local builtin = require('telescope.builtin')

local map = vim.keymap.set
local themes = require("telescope.themes")

-- files
map('n', '<leader>rr', builtin.oldfiles)
map('n', '<leader>fb', builtin.buffers)
map('n', '<leader>sg', builtin.grep_string)
map('n', '<leader>sb', builtin.current_buffer_fuzzy_find)

-- diagnostics
map('n', '<leader>dd', builtin.lsp_type_definitions)
map('n', '<leader>so', builtin.lsp_document_symbols)
map('n', '<leader>gr', builtin.lsp_references)
map('n', '<leader>gd', builtin.lsp_definitions)
map('n', '<leader>gi', builtin.lsp_implementations)
map('n', '<leader>gt', builtin.lsp_type_definitions)

-- help
map('n', '<leader>hh', builtin.help_tags)

-- git
map('n', '<leader>gb', builtin.git_branches)
map('n', '<leader>gc', builtin.git_commits)
map('n', '<leader>gs', builtin.git_status)


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
