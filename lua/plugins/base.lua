-- 代码注释 gcc
require("Comment").setup()

-- 括号自动补全
require("nvim-autopairs").setup()

-- 语法高亮增强
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

