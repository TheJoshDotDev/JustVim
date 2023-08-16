require('catppuccin').setup({
	flavour = 'macchiato',
	terminal_colors = true,
	styles = {
		comments = { "italic" }
	},
})

vim.cmd('colorscheme catppuccin')
