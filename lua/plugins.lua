return {
  -- Fuzzy
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'ahmedkhalf/project.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim'

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
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {

      { 'nvim-treesitter/nvim-treesitter-textobjects' },

      -- this specific branch adds a fix
      {
        "elgiano/nvim-treesitter-angular",
        branch = "topic/jsx-fix"
      }
    },
    build = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end
  },

  -- Lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'dev-v3',
    dependencies = {
      -- Lsp
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim', },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'pmizio/typescript-tools.nvim' },

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
      require('config.lsp.init')
    end
  },
  -- UI
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('config.catppuccin')
    end
  },
  {
    'SmiteshP/nvim-navic',
    config = function()
      require('config.navic')
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
    opts = {}
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
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
      { "<leader>bd", function() require("mini.bufremove").delete(0, true) end },
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
  {
    'github/copilot.vim'
  },

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

  -- tmux
  {
    "christoomey/vim-tmux-navigator"
  }
}
