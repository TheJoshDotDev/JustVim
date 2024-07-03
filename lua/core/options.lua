local o = vim.opt

-- general
o.termguicolors = true
o.number = true
o.relativenumber = true
o.background = "dark"
o.cursorline = true
o.scrolloff = 8

-- editor
o.clipboard:append("unnamedplus")
o.numberwidth = 5
o.expandtab = true
o.autoindent = true
o.tabstop = 2
o.shiftwidth = 2
o.wrap = false
o.splitright = true
o.splitbelow = true
o.signcolumn = "yes"
o.fillchars = { eob = " " }
o.colorcolumn = "100" 

-- search
o.ignorecase = true
o.smartcase = true

o.laststatus = 3
o.foldmethod = "manual"
