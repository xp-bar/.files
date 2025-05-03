-- xp-bar/fzf.lua
-- vim: set ts=2 sw=2:
--
-- My fzf config.

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
