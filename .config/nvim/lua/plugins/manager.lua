vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    -- LSP
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  }
  use {
    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use {
    -- Completions
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip'
  }
  use {
    -- Snippet engine
    'L3MON4D3/LuaSnip',
    -- Snippets
    'rafamadriz/friendly-snippets'
  }
  use {
    -- UI
    {
      'akinsho/bufferline.nvim',
      tag = "*",
      requires = 'nvim-tree/nvim-web-devicons'
    },
    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-tree.lua'
  }
  -- Document
end)
