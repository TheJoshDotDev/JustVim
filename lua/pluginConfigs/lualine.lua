local M = {}

local nvim_navic = require("nvim-navic")

local apple_logo = ""
local symbols_modified = " ●"
local symbols_readonly = " "

M.opts = function(_, opts)
  opts.tabline = {
    lualine_b = {
      {
        "filename",
        symbols = {
          modified = symbols_modified,
          readonly = symbols_readonly,
        },
      },
    },
    lualine_c = {
      {
        function()
          return nvim_navic.get_location()
        end,
        cond = function()
          return package.loaded["nvim-navic"] and nvim_navic.is_available()
        end,
      },
    },
    lualine_y = { "tabs" },
  }
  opts.sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(mode)
          return apple_logo .. " " .. mode
        end,
      },
    },
  }
end

return M
