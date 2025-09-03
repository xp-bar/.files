-- xp-bar/theme.lua
-- vim: set ts=2 sw=2:
--
-- My treesitter themeing configs.

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
    lightblack = "#3E4451",
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
      ['@punctuation.bracket'] = { fg = '${white}'},
      ['@operator'] = { fg = '${white}'},

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
      ['@namespace.separator.php'] = { fg = '${darkgray}'},
      ['@operator.php'] = { fg = '${white}'},
      ['@method.call.php'] = { fg = '${white}'},
      ['@function.internal.call.php'] = { fg = '${cyan}'},
      ['@primitive_type.php'] = { fg = '${purple}'},
      ['@type.original.php'] = { fg = '${white}'},
      ['@type.builtin.php'] = { fg = '${purple}'},
      ['@variable.builtin.php'] = { fg = '${red}'},
      ['@module.php'] = { fg = '${white}'},
      ['@php_tag'] = { fg = '${cyan}'},

      ['@keyword.phpdoc'] = { fg = '${white}'},
      ['@keyword.pipe.phpdoc'] = { fg = '${white}'},
      ['@keyword.dollar.phpdoc'] = { fg = '${red}'},
      ['@type.primitive.phpdoc'] = { fg = '${purple}'},
      ['@code.phpdoc'] = { fg = '${purple}'},

      ['@text.diff.delete.diff'] = { fg = '${red}'},
      ['@text.diff.add.diff'] = { fg = '${green}'},

      CocCursorRange = { fg = '${gray}'},
      CocErrorFloat = { fg = '${red}'},
      CocInfoFloat = { fg = '${cyan}'},
      CocUnusedHighlight = { fg = '${gray}' },
      CocWarningFloat = { fg = '${yellow}'},

      DiagnosticError = { fg = '${darkred}' },
      DiagnosticHint = { fg = '${blue}'},
      DiagnosticInfo = { fg = '${green}'},
      DiagnosticOk = { fg = '${cyan}'},

      DiagnosticUnderlineError = { fg = 'NONE', underline = true },
      DiagnosticUnderlineHint = { fg = '${blue}', underline = true},
      DiagnosticUnderlineInfo = { fg = '${green}', underline = true},
      DiagnosticUnderlineOk = { fg = '${cyan}', underline = true},
      DiagnosticUnderlineWarn = { fg = '${yellow}', underline = true},
      DiagnosticVirtualTextError = { fg = '${darkred}', italic = true },
      DiagnosticWarn = { fg = '${yellow}'},

      FzfLuaHeaderBind = { fg = '${red}'},
      FzfLuaHeaderText = { fg = '${yellow}'},
      FzfLuaCursor = { fg = 'NONE'},
      FzfLuaCursorLine = { bg = '${lightblack}'},
      FzfLuaSearch = { fg = '${red}', underline = true },

      GitGutterAdd = { fg = '${green}' },
      GitGutterAddLine = { fg = '${green}', bg = '${gray}' },
      GitGutterChange = { fg = '${orange}' },
      GitGutterChangeDelete = { fg = '${red}', bg = '${gray}' },
      GitGutterChangeLine = { fg = '${orange}', bg = '${gray}' },
      GitGutterDelete = { fg = '${red}' },
      GitGutterDeleteLine = { fg = '${red}', bg = '${gray}' },

      IndentLine = { fg = '${lightblack}', bg = 'NONE' },
      IndentLineCurrent = { fg = '${gray}', bg = 'NONE' },

      IblIndent = { fg = '${lightblack}', bg = 'NONE' },
      IblScope = { fg = '${gray}', bg = 'NONE' },

      LspReferenceText = {},
      LspReferenceRead = { bg = '${gray}'},
      LspReferenceWrite = { bg = '${gray}', underline = true},

      GitSignsAdd = { fg = '${green}', bg = '' },
      GitSignsStagedAdd = { fg = '', bg = '${green}'},

      GitSignsChange = { fg = '${orange}', bg = '' },
      GitSignsStagedChange = { fg = '', bg = '${orange}' },

      GitSignsChangedelete = { fg = '${orange}', bg = '' },
      GitSignsStagedChangedelete = { fg = '', bg = '${orange}' },

      GitSignsDelete = { fg = '${red}', bg = '' },
      GitSignsStagedDelete = { fg = '', bg = '${red}' },

      GitSignsTopDelete = { fg = '${red}', bg = '' },
      GitSignsStagedTopDelete = { fg = '', bg = '${red}' },

      StartifyBracket = { fg = '${blue}' },
      StartifyFile = { fg = '${red}' },
      StartifyFooter = { fg = '${fg}' },
      StartifyHeader = { fg = '${fg}' },
      StartifyNumber = { fg = '${orange}' },
      StartifyPath = { fg = '${blue}' },
      StartifySection = { fg = '${purple}' },
      StartifySelect = { fg = '${cyan}' },
      StartifySlash = { fg = '${blue}' },
      StartifySpecial = { fg = '${gray}' },

      zshDeref = { fg = '${red}'},
      zshFunction = { fg = '${cyan}' },
      zshKSHFunction = { fg = '${cyan}' },
      zshOldSubst = { fg = '${red}' },
      zshPreProc = { fg = '${red}' },
      zshShortDeref = { fg = '${red}'},
      zshSubstDelim = { fg = '${gray}' },
      zshSubstQuoted = { fg = 'gray' },
      zshTypes = { fg = '${purple}' },
      zshVariableDef = { fg = '${orange}' },
  },
})

vim.cmd("colorscheme onedark")

require('ibl').setup({
  scope = {
    enabled = true,
    exclude = {
      language = {
        'css', 'scss', 'sass'
      }
    }
  },
  indent = {
    char = '▏',
  },
  exclude = {
    filetypes = {
      --defaults
      'lspinfo',
      'packer',
      'checkhealth',
      'help',
      'man',
      'gitcommit',
      'TelescopePrompt',
      'TelescopeResults',
      -- additions
      'startify',
      'markdown',
      'xxx'
    }
  },
})
