local navic = require("nvim-navic")

local apple_logo = ""
local symbols_modified = " ●"
local symbols_readonly = " "

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
    globalstatus = true,
  },
  inactive_winbar = {
    lualine_c = {
      {
        "filename",

        symbols = {
          modified = symbols_modified,
          readonly = symbols_readonly,
        },
      },
      {
        function()
          return navic.get_location()
        end,
        cond = function()
          return package.loaded["nvim-navic"] and navic.is_available()
        end,
      }
    },
    lualine_y = { "progress" },
  },
  winbar = {
    lualine_c = {
      {
        "filename",
        symbols = {
          modified = symbols_modified,
          readonly = symbols_readonly,
        },
      },
      {
        function()
          return navic.get_location()
        end,
        cond = function()
          return package.loaded["nvim-navic"] and navic.is_available()
        end,
      }
    },
    lualine_y = { "progress" },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(mode)
          return apple_logo .. " " .. mode
        end,
      },
    },
  }
})
