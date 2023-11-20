-- xp-bar.lua
-- vim: set ts=2 sw=2:

require('nvim-dap-config')

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "diff",
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
      ['@variable.builtin'] = { fg = '${red}'},

      ['@variable.builtin.vim'] = { fg = '${red}'},
      ['@function.macro.vim'] = { fg = '${orange}'},
      ['@function.macro.call.vim'] = { fg = '${yellow}'},
      ['@function.vim'] = { fg = '${cyan}'},
      ['@function.call.vim'] = { fg = '${blue}'},
      ['@function.internal.call.vim'] = { fg = '${purple}'},
      ['@namespace.vim'] = { fg = '${red}'},
      ['@keycode.vim'] = { fg = '${blue}'},
      ['@constant.vim'] = { fg = '${yellow}'},
      ['@punctuation.bracket.vim'] = { fg = '${gray}'},

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

      ['@text.diff.delete.diff'] = { fg = '${red}'},
      ['@text.diff.add.diff'] = { fg = '${green}'},

      GitGutterAdd = { fg = '${green}' },
      GitGutterChange = { fg = '${orange}' },
      GitGutterDelete = { fg = '${red}' },
      GitGutterChangeDelete = { fg = '${red}' },

      GitGutterAddLine = { fg = '${green}', bg = '${gray}' },
      GitGutterChangeLine = { fg = '${orange}', bg = '${gray}' },
      GitGutterDeleteLine = { fg = '${red}', bg = '${gray}' },
      GitGutterChangeDelete = { fg = '${red}', bg = '${gray}' },

      DbgCurrentLine = {},
      DbgCurrentSign = { fg = '${green}'},
      DbgBreakptLine = {},
      DbgBreakptSign = { fg = '${cyan}'},

      CocErrorFloat = { fg = '${red}'},
      CocWarningFloat = { fg = '${yellow}'},
      CocInfoFloat = { fg = '${cyan}'},
      CocCursorRange = { fg = '${gray}'},
      CocUnusedHighlight = { fg = '${gray}' },
  },
})

vim.cmd("colorscheme onedark")
