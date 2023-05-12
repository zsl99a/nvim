
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

