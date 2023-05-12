-- 主题
vim.cmd[[colorscheme tokyonight-storm]]

-- 底部状态栏
require('lualine').setup {
  options = {
    theme = 'tokyonight',
  }
}

