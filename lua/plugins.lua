local lualine_configs = require("plugin_configs.lualine")
local telescope_configs = require("plugin_configs.telescope")
local trouble_configs = require("plugin_configs.trouble")
local noice_configs = require("plugin_configs.noice")
local treesitter_configs = require("plugin_configs.treesitter")
local indent_blankline_configs = require("plugin_configs.indent_blankline")
local zen_mode_configs = require("plugin_configs.zen_mode")
local neogen_configs = require("plugin_configs.neogen")
local alpha_configs = require("plugin_configs.alpha")

return {
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
    "nvim-telescope/telescope.nvim",
    keys = telescope_configs.keys,
    opts = telescope_configs.opts,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "folke/trouble.nvim",
    keys = trouble_configs.keys,
  },
  {
    "folke/noice.nvim",
    opts = noice_configs.opts,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = treesitter_configs.opts,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = lualine_configs.opts,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = indent_blankline_configs.opts,
  },
  {
    "goolord/alpha-nvim",
    opts = alpha_configs.opts,
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    keys = neogen_configs.keys,
  },
  {
    "folke/zen-mode.nvim",
    keys = zen_mode_configs.keys,
    opts = zen_mode_configs.opts,
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
