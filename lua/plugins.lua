return {
  -- Fuzzy
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'ahmedkhalf/project.nvim'
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
      { "<leader>rr", "<cmd>Telescope oldfiles<cr>" },
    },
    config = function()
      require('config.telescope')
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end
  },

  -- Lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- Lsp
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'jose-elias-alvarez/null-ls.nvim' },

      -- Completion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      -- Pretty
      { 'onsails/lspkind.nvim' },
    },
    config = function()
      require('config.lsp')
    end
  },

  -- UI
  {
    'catppuccin/nvim',
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('config.catppuccin')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'SmiteshP/nvim-navic',
    },
    config = function()
      require('config.lualine')
    end
  },
  -- Editor
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    dependencies = 'neovim/nvim-lspconfig'
  },
  {
    'tpope/vim-sleuth'
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.indent_blankline')
    end
  },
  {
    'numToStr/Comment.nvim',
    VeryLazy = true,
    opts = {}
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    VeryLazy = true,
    config = function()
      require('todo-comments').setup()
    end
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    opts = {}
  },
  {
    'echasnovski/mini.bufremove',
    version = '*',
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end },
    },
    opts = {}
  },
  {
    'folke/zen-mode.nvim',
    keys = {
      { "<leader>fo", "<cmd>ZenMode<cr>" },
    },
    opts = {}
  },
  { 'github/copilot.vim' },

  -- Git
  {
    'tpope/vim-fugitive',
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end
  },

  -- Others
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {}
  },
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.alpha')
    end
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('config.project')
    end
  },
}
