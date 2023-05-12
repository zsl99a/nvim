local telescope = require("telescope")
telescope.setup({
  pickers = {
    find_files = {
      -- find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "-g", "!.git" },
      cache_picker = { num_pickers = 100 },
    },
  }
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

