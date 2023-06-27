local icons = require("lazyvim.config").icons

local logo = [[
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─────────██████─██████████████─██████████████─██████──██████────────████████████───██████████████─██████──██████─
─────────██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██────────██░░░░░░░░████─██░░░░░░░░░░██─██░░██──██░░██─
─────────██░░██─██░░██████░░██─██░░██████████─██░░██──██░░██────────██░░████░░░░██─██░░██████████─██░░██──██░░██─
─────────██░░██─██░░██──██░░██─██░░██─────────██░░██──██░░██────────██░░██──██░░██─██░░██─────────██░░██──██░░██─
─────────██░░██─██░░██──██░░██─██░░██████████─██░░██████░░██────────██░░██──██░░██─██░░██████████─██░░██──██░░██─
─────────██░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██────────██░░██──██░░██─██░░░░░░░░░░██─██░░██──██░░██─
─██████──██░░██─██░░██──██░░██─██████████░░██─██░░██████░░██────────██░░██──██░░██─██░░██████████─██░░██──██░░██─
─██░░██──██░░██─██░░██──██░░██─────────██░░██─██░░██──██░░██────────██░░██──██░░██─██░░██─────────██░░░░██░░░░██─
─██░░██████░░██─██░░██████░░██─██████████░░██─██░░██──██░░██─██████─██░░████░░░░██─██░░██████████─████░░░░░░████─
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░██─██░░░░░░░░████─██░░░░░░░░░░██───████░░████───
─██████████████─██████████████─██████████████─██████──██████─██████─████████████───██████████████─────██████─────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>sh", false },
      { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          height = 0.7,
          width = 0.6,
          prompt_position = "top",
        },
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xx", false },
      { "<leader>xX", false },
      { "<leader>tr", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { pattern = "^:", icon = "󰘳", lang = "vim" },
        },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "jsdoc")
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    name = "onedark",
    opts = {
      style = "darker",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      tabline = {
        lualine_c = {
          {
            "filename",
            symbols = {
              modified = " ●",
              readonly = " ",
            },
          },
        },
        lualine_y = { "tabs" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(s)
              return " " .. s
            end,
          },
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context_start = true,
      show_trailing_blankline_indent = true,
      show_current_context = true,
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },

  -- Diabaled plugins
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "stevearc/dressing.nvim",
    enabled = false,
  },
  {
    "nvim-pack/nvim-spectre",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },
  {
    "SmiteshP/nvim-navic",
    enabled = false,
  },
  {
    "simrat39/symbols-outline.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.surround",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    enabled = false,
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
  },
}
