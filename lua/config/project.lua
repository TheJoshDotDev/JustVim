local project = require('project_nvim')
local telescope = require('telescope')

project.setup({
  manual_mode = true,
  detection_methods = { 'pattern', 'lsp' },
  exclude_dirs = { '.git', 'node_modules', '.cache' },
})

telescope.load_extension('projects')

vim.keymap.set('n', '<leader>fp', function()
  telescope.extensions.projects.projects {}
end)

vim.keymap.set('n', '<leader>np', '<cmd>ProjectRoot<cr>')
