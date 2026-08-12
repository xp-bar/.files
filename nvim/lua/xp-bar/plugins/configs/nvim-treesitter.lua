require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install {
  "css",
  "diff",
  "html",
  "blade",
  "gdscript",
  "javascript",
  "lua",
  "markdown",
  "markdown_inline",
  "php",
  "phpdoc",
  "query",
  "ruby",
  "scss",
  "sql",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
}
