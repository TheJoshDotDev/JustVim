local navic = require("nvim-navic")
local lualine = require("lualine")

local apple_logo = ""
local symbols_modified = " ●"
local symbols_readonly = " "

local customWinbar = {
  lualine_c = {
    {
      "filename",
      symbols = {
        modified = symbols_modified,
        readonly = symbols_readonly,
      },
    },
  },
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  tabline = {
    lualine_a = {
      {
        function()
          local cwd = vim.fn.getcwd()
          return " " .. cwd:match("%w+$")
        end,
      }
    },
    lualine_c = {
      {
        function()
          return navic.get_location()
        end,
        cond = function()
          return package.loaded["nvim-navic"] and navic.is_available()
        end,
      }
    },
    lualine_y = {
      { "tabs" }
    }
  },
  inactive_winbar = customWinbar,
  winbar = customWinbar,
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(mode)
          return apple_logo .. " " .. mode
        end,
      }
    },
    lualine_b = {
      {
        "branch",
        icon = "",
      }
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        always_visible = false,
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
    },
    lualine_x = {
      {
        "diff",
        colored = true,
        always_visible = false,
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
      },
    },
    lualine_y = {
      {
        "filetype",
        colored = false,
      },
      {
        "progress",
      },
    },
    lualine_z = {
      {
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' ',
      },
    },
  }
})
