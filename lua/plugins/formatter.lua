require("lsp-format").setup()

vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
