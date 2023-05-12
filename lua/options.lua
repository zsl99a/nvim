local opt = vim.opt
local keymap = vim.keymap

-- 主题
vim.cmd[[colorscheme tokyonight-storm]]

-- 行号
opt.number = true
opt.relativenumber = true

-- 代码提示框高度
opt.pumheight = 30

opt.tabstop = 4
opt.shiftwidth = 4

-- 启用鼠标
opt.mouse = 'a'

-- 系统剪切板
opt.clipboard = 'unnamedplus'

-- 默认新窗口右和下
-- opt.splitright = true
-- opt.splitbelow = true

-- 终端颜色
opt.termguicolors = true
opt.signcolumn = 'yes'


-- 移动选中的代码块
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
keymap.set('v', 'H', '<gv')
keymap.set('v', 'L', '>gv')

-- 翻半页并居中
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', '<C-d>', '<C-d>zz')

-- 文件树
vim.g.nvim_tree_ignore = {'target'}
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')


-- 变量重命名
keymap.set('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')



