local keymap = vim.keymap

if vim.g.vscode then
end

require("core.keymaps")
require("core.options")
require("core.globals")
require("core.lazy")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("core.autocmd")
