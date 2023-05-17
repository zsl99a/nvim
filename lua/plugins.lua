
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'


  -- github copilot
  use 'github/copilot.vim'

  -- 主题
  use 'folke/tokyonight.nvim'

  -- 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- 目录树
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- 窗口定位
  use 'christoomey/vim-tmux-navigator'

  -- 语法高亮
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'
  use 'RRethy/vim-illuminate'

  -- 代码注释
  use 'numToStr/Comment.nvim'
  -- 括号自动补全
  use 'windwp/nvim-autopairs'

  -- 文件搜索
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- 代码格式化
  use 'lukas-reineke/lsp-format.nvim'

  -- 代码提示
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use 'zbirenbaum/copilot.lua'
  use {
    "zbirenbaum/copilot-cmp",
	after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }

  use 'onsails/lspkind-nvim'
  use {
    'L3MON4D3/LuaSnip',
    run = 'make install_jsregexp'
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'

  -- 类型提示
  use 'simrat39/rust-tools.nvim'



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


