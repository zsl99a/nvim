
require("plugins")
require("options")

-- Install packer.nvim if not exists

require('lualine').setup {
  options = {
    theme = 'gruvbox',
  }
}

require('nvim-tree').setup()


local telescope = require("telescope")
telescope.setup({
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "-g", "!.git" },
      cache_picker = { num_pickers = 100 },
    },
  }
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})



require("mason").setup()
require("mason-lspconfig").setup()


local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  window = {
    documentation = {
      max_height = 50,
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-10),
    ["<C-n>"] = cmp.mapping.scroll_docs(10),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "vsnip" },
    { name = "nvim_lua" },
  },
  formatting = {
    fields = {
      "kind",
      "abbr",
      "menu",
    },
    format = function(entry, vim_item)
      vim_item.kind = string.format(
	"%s %s",
	require("lspkind").presets.default[vim_item.kind],
	vim_item.kind
      )
      vim_item.menu = ({
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	path = "[Path]",
	vsnip = "[Vsnip]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})
cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
})



require("rust-tools").setup({
  server = {
    on_attach = function(client, bufnr)
      require("mason-lspconfig").on_attach(client, bufnr)
    end,
  },
})


