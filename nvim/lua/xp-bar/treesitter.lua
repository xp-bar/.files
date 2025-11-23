-- xp-bar/treesitter.lua
-- vim: set ts=2 sw=2:
--
-- My treesitter configs.

vim.keymap.set('n', '<leader>i', '<cmd>Inspect<cr>', {silent = true})
vim.keymap.set('n', '<leader>I', '<cmd>InspectTree<cr>', {silent = true})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.erb = {
  install_info = {
    url = "~/.config/nvim/dependencies/tree-sitter-embedded-template/", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "eruby", -- if filetype does not match the parser name
}

parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "css",
      "diff",
      "erb",
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
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    -- list of language that will be disabled (by parser name)
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  fold = {
      enable = true
  }
}
