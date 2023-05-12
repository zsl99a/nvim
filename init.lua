
require("plugins")
require("options")

-- Install packer.nvim if not exists

require('lualine').setup {
  options = {
    theme = 'tokyonight',
  }
}

require('nvim-tree').setup({
  filters = {
	dotfiles = false,
  },
  git = {
    ignore = false,
  },
})


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


require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "rust", "lua", "python", "bash", "toml", "json", "yaml", "html", "css", "javascript", "typescript", "tsx", "vue",
    "svelte", "php", "java", "go", "dockerfile", "regex", "query", "comment", "toml", "tsx", "vue", "svelte", "php", "java",
    "go", "dockerfile", "regex", "query", "comment"
  },
  highlight = {
	enable = true,
	additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
	enable = true,
	extended_mode = true,
	max_file_lines = nil,
  },
})


require("Comment").setup()
require("nvim-autopairs").setup()


local lspconfigs = {
  "lua_ls", "rust_analyzer", "tsserver", "html", "cssls", "jsonls", "yamlls", "bashls", "vimls",
}
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lspconfigs,
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
for _, lsp in ipairs(lspconfigs) do
  lspconfig[lsp].setup({
	capabilities = capabilities,
  })
end


require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
local cmp = require("cmp")
local luasnip = require("luasnip")
require("lspkind").init({
  mode = "symbol_text",
  preset = "codicons",
  symbol_map = {
    Copilot = "",
  }
})
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
    { name = "copilot" },
	{ name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "vsnip" },
  },
  formatting = {
	format = require("lspkind").cmp_format()
  },
})
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
	{ name = "path" },
  },
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
	{ name = "path" },
  },
})
require("rust-tools").setup()


