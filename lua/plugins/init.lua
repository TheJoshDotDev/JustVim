return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = function(_, opts)
      opts.flavour = "macchiato"
      opts.integrations.neotree = true
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options.mode = "tabs"
      opts.options.always_show_bufferline = true
      opts.options.offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "left",
          highlight = "Directory",
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      opts.show_current_context_start = true
      opts.show_trailing_blankline_indent = true
      opts.show_current_context = true
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
    "echasnovski/mini.indentscope",
    enabled = false,
  },
}
