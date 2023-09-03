require('typescript-tools').setup({
	on_attach = function(client)
		-- disable tsserver formatting if you plan on formatting via null-ls

		-- TODO: fix this not working
		-- client.resolved_capabilities.document_formatting = false

		vim.keymap.set('n', '<leader>oi', '<cmd>TSToolsOrganizeImports<cr>')
		vim.keymap.set('n', '<leader>si', '<cmd>TSToolsSortImports<cr>')
		vim.keymap.set('n', '<leader>ri', '<cmd>TSToolsRemoveUnusedImports<cr>')
		vim.keymap.set('n', '<leader>ru', '<cmd>TSToolsRemoveUnused<cr>')
		vim.keymap.set('n', '<leader>ai', '<cmd>TSToolsAddMissingImports<cr>')
		vim.keymap.set('n', '<leader>fa', '<cmd>TSToolsFixAll<cr>')
	end,
	tsserver_plugins = {
		'styled-components',
	}
})
