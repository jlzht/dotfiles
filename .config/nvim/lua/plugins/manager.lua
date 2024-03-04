local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
  vim.cmd([[:q]])
end

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
    'hrsh7th/cmp-cmdline',
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
      tag = '*',
      requires = 'nvim-tree/nvim-web-devicons'
    },
    'lukas-reineke/indent-blankline.nvim',
    'nvim-lualine/lualine.nvim',
  }
  use {
    -- Utils
    'akinsho/toggleterm.nvim',
    {
      'nvim-telescope/telescope.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }
  }
  use {
    -- Linting
    'mfussenegger/nvim-lint'
  }
  use {
    -- Formatting
    'mhartington/formatter.nvim'
  }
  use {
    -- Notes
    {
      'iamcco/markdown-preview.nvim',
      run = function()
        vim.fn["mkdp#util#install"]()
      end
    },
    'renerocksai/telekasten.nvim'
  }
end)
