-- xp-bar.lua
-- vim: set ts=2 sw=2:

-- require('nvim-dap-config')

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
  },
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.3',
        path = {
          '?.lua',
          '?/init.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
          '/usr/share/5.3/?.lua',
          '/usr/share/lua/5.3/?/init.lua'
        }
      },
      workspace = {
        library = {
          vim.fn.expand'~/.luarocks/share/lua/5.3',
          '/usr/share/lua/5.3',
          '${3rd}/love2d/library'
        }
      }
    }
  }
})

vim.lsp.enable('ts_ls')
vim.lsp.config('ts_ls', {
  capabilities = capabilities,
})

-- vim.lsp.enable('cssls')
-- vim.lsp.config('cssls', {
--   capabilities = capabilities,
-- })
-- vim.lsp.enable('cssmodules_ls')
-- vim.lsp.config('cssmodules_ls', {
--   capabilities = capabilities,
-- })
-- vim.lsp.enable('somesass_ls')
-- vim.lsp.config('somesass_ls', {
--   capabilities = capabilities,
-- })
-- vim.lsp.enable('ruby_lsp')
-- vim.lsp.config('ruby_lsp', {
--   capabilities = capabilities,
-- })

vim.lsp.enable('solargraph')
vim.lsp.config('solargraph', {
  capabilities = capabilities,
  init_options = {
    formatting = false
  },
  settings = {
    solargraph = {
      diagnostics = false
    }
  }
})

-- vim.lsp.enable('sorbet')
-- vim.lsp.config('sorbet', {
--   capabilities = capabilities,
-- })

vim.lsp.enable('intelephense')
vim.lsp.config('intelephense', {
  capabilities = capabilities,
  init_options = {
    licenceKey = os.getenv('INTELEPHENSE_LICENSE_KEY'),
  }
})

local actions = require "fzf-lua.actions"
require('fzf-lua').setup({'default',
  fzf_opts = {
    ['--layout'] = false,
  },
  fzf_colors = {
    ["bg"]      = "-1",
    ["fg"]      = "#5c6370",
    ["bg+"]     = "-1",
    ["fg+"]     = "#fefefe",
    ["pointer"] = "#e06c75",
    ["hl"]      = "#98c379",
    ["hl+"]     = "#98c379",
  },
  file_icons = false,
  actions = {
    files = {
      ["default"]     = actions.file_edit_or_qf,
      ["ctrl-s"]      = actions.file_split,
      ["ctrl-v"]      = actions.file_vsplit,
      ["ctrl-t"]      = actions.file_tabedit,
      -- ["alt-q"]       = actions.file_sel_to_qf,
      -- ["alt-l"]       = actions.file_sel_to_ll,
      ["ctrl-q"]       = actions.file_sel_to_qf,
      ["ctrl-l"]       = actions.file_sel_to_ll,
    },
    buffers = {
      -- providers that inherit these actions:
      --   buffers, tabs, lines, blines
      ["default"]     = actions.buf_edit,
      ["ctrl-s"]      = actions.buf_split,
      ["ctrl-v"]      = actions.buf_vsplit,
      ["ctrl-t"]      = actions.buf_tabedit,
    }
  },
  files = {
    previewer = 'bat',
    file_icons = false,
    cmd = 'rg --files',
    RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH,
    toggle_ignore_flag = "--no-ignore",
    actions = {
      ["ctrl-g"] = { actions.toggle_ignore }
    }
  },
  grep = {
    actions = {
      ["ctrl-g"] = { actions.toggle_ignore },
      ["ctrl-r"] = { actions.grep_lgrep }
    },
  },
  lsp = {
    includeDeclaration = false,
    symbols = {
      -- false: disable, 1: icon+kind, 2: icon only, 3: kind only
      symbol_style = 3
    },
    -- actions = {
    --   ["default"] = actions.file_edit_or_qf
    -- }
  }
})


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

      LspReferenceText = {},
      LspReferenceRead = { bg = '${gray}'},
      LspReferenceWrite = { bg = '${gray}', underline = true},

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
