local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yankGroup = augroup('HighlightYank', {})
local netrwCreateFile = augroup('NetrwCreateFile', {})
local closeWindows = augroup('CloseWindows', {})

autocmd('TextYankPost', {
  group = yankGroup,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 100
    })
  end
})

autocmd('FileType', {
  group = netrwCreateFile,
  pattern = 'netrw',
  callback = function()
    vim.keymap.set('n', 'a', '%', { remap = true, buffer = true })
  end
})


autocmd('FileType', {
  group = closeWindows,
  pattern = { 'help', 'fugitive' },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = true })
  end
})


-- local vimFugitive = augroup('VimFugitive', {})
--
-- autocmd('FileType', {
--   group = vimFugitive,
--   pattern = 'fugitive',
--   callback = function()
--     vim.keymap.set('n', '<leader>pp', '<cmd>Git push<cr>')
--     vim.keymap.set('n', '<leader>po', '<cmd>Git push -u origin<cr>')
--   end
-- })
