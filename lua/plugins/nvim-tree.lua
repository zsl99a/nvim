require('nvim-tree').setup({
  filters = {
	dotfiles = false,
  },
  git = {
    ignore = false,
  },
})
vim.g.nvim_tree_ignore = {'target'}
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

