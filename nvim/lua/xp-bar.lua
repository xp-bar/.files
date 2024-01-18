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

require("onedarkpro").setup({
  colors = {
    bg = "#282c34",
    fg = "#abb2bf",
    red = "#e06c75",
    darkred = "#be5046",
    orange = "#d19a66",
    yellow = "#e5c07b",
    green = "#98c379",
    cyan = "#56b6c2",
    blue = "#61afef",
    purple = "#c678dd",
    white = "#abb2bf",
    black = "#282c34",
    lightgray = "#4b5263",
    gray = "#5c6370",
    darkgray = "#828997",
    highlight = "#e2be7d",
    comment = "#7f848e",
    none = "NONE",
  },
  highlights = {
      Operator = { fg = '${red}' },
      MatchParen = { fg = '${red}', bg = '${black}', italic = true },
      NormalFloat = { bg = '${black}' },

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
      ['@constant.class.keyword.php'] = { link = '@keyword.php' },
      ['@scope.keyword.php'] = { link = '@keyword.php' },
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

      DiagnosticError = { fg = '${darkred}' },
      DiagnosticUnderlineError = { fg = 'NONE', underline = true },
      DiagnosticVirtualTextError = { fg = '${darkred}', italic = true },

      DiagnosticWarn = { fg = '${yellow}'},
      DiagnosticUnderlineWarn = { fg = '${yellow}', underline = true},
      DiagnosticInfo = { fg = '${green}'},
      DiagnosticUnderlineInfo = { fg = '${green}', underline = true},
      DiagnosticHint = { fg = '${blue}'},
      DiagnosticUnderlineHint = { fg = '${blue}', underline = true},
      DiagnosticOk = { fg = '${cyan}'},
      DiagnosticUnderlineOk = { fg = '${cyan}', underline = true},

      CocErrorFloat = { fg = '${red}'},
      CocWarningFloat = { fg = '${yellow}'},
      CocInfoFloat = { fg = '${cyan}'},
      CocCursorRange = { fg = '${gray}'},
      CocUnusedHighlight = { fg = '${gray}' },

      StartifyBracket = { fg = '${blue}' },
      StartifyFile = { fg = '${red}' },
      StartifyFooter = { fg = '${fg}' },
      StartifyHeader = { fg = '${fg}' },
      StartifyNumber = { fg = '${orange}' },
      StartifyPath = { fg = '${blue}' },
      StartifySlash = { fg = '${blue}' },
      StartifySection = { fg = '${purple}' },
      StartifySelect = { fg = '${cyan}' },
      StartifySpecial = { fg = '${gray}' },

      zshVariableDef = { fg = '${orange}' },
      zshTypes = { fg = '${purple}' },
      zshPreProc = { fg = '${red}' },
      zshKSHFunction = { fg = '${cyan}' },
      zshFunction = { fg = '${cyan}' },
      zshSubstQuoted = { fg = 'gray' },
      zshOldSubst = { fg = '${red}' },
      zshSubstDelim = { fg = '${gray}' },
      zshDeref = { fg = '${red}'},
      zshShortDeref = { fg = '${red}'},
  },
})

vim.cmd("colorscheme onedark")
