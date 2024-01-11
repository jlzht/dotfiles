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
    'hrsh7th/cmp-nvim-lua'
  }
  use {
    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets'
  }

  -- Document
end)
