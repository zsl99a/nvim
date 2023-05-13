require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

require("lspkind").init({
  mode = "symbol_text",
  preset = "codicons",
  symbol_map = {
    Copilot = "",
  }
})

local cmp = require("cmp")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  window = {
    documentation = {
      max_height = 50,
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-10),
    ["<C-f>"] = cmp.mapping.scroll_docs(10),
    ["<C-.>"] = cmp.mapping.complete(),
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
    { name = "copilot" },
    { name = "cmdline" },
    { name = "path" },
  },
})

