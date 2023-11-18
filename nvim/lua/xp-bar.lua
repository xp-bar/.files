-- xp-bar.lua
require('nvim-dap-config')

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "html",
      "javascript",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "phpdoc",
      "query",
      "sql",
      "typescript",
      "vim",
      "vimdoc",
      "vue"
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

require("onedarkpro").setup({
  colors = {
    bg = "#282c34",
    fg = "#abb2bf",
    red = "#e06c75",
    orange = "#d19a66",
    yellow = "#e5c07b",
    green = "#98c379",
    cyan = "#56b6c2",
    blue = "#61afef",
    purple = "#c678dd",
    white = "#abb2bf",
    black = "#282c34",
    gray = "#5c6370",
    highlight = "#e2be7d",
    comment = "#7f848e",
    none = "NONE",
  },
  highlights = {
      ['@constant.access.php'] = { fg = '${red}'},
      ['@constant.builtin.php'] = { fg = '${purple}'},
      ['@constant.class.keyword.php'] = { fg = '${purple}'},
      ['@namespace.php'] = { fg = '${white}'},
      ['@operator.php'] = { fg = '${white}'},
      ['@method.call.php'] = { fg = '${white}'},
      ['@function.internal.call.php'] = { fg = '${cyan}'},
      ['@primitive_type.php'] = { fg = '${purple}'},
      ['@type.original.php'] = { fg = '${white}'},
      ['@type.builtin.php'] = { fg = '${purple}'},
      ['@variable.builtin.php'] = { fg = '${red}'},

      ['@keyword.phpdoc'] = { fg = '${white}'},
      ['@keyword.pipe.phpdoc'] = { fg = '${white}'},
      ['@keyword.dollar.phpdoc'] = { fg = '${red}'},
      ['@type.primitive.phpdoc'] = { fg = '${purple}'},
      ['@code.phpdoc'] = { fg = '${purple}'},
  },
})

vim.cmd("colorscheme onedark")
