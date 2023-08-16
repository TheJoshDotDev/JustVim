local keymap = vim.keymap

if vim.g.vscode then
  print("VSCode detected, skipping init.lua")
  vim.g.mapleader = " "
  -- use jk to exit insert mode
  keymap.set("i", "jj", "<ESC>")
else
  require("core.keymaps")
  require("core.options")
  require("core.globals")
  require("core.lazy")

  vim.g.netrw_browse_split = 0
  vim.g.netrw_banner = 0
  vim.g.netrw_winsize = 25

  require("core.autocmd")
end
