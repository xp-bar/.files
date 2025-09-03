-- xp-bar/plugins/gitsigns.lua
-- vim: set ts=2 sw=2:

require('gitsigns').setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '-' },
    untracked    = { text = '#' },
  },
  signs_staged = {
    add          = { text = '++' },
    change       = { text = '~~' },
    delete       = { text = '__' },
    topdelete    = { text = '‾_' },
    changedelete = { text = '--' },
    untracked    = { text = '##' },
  },
  signs_staged_enable = true,
  signcolumn = true,
  numhl      = true,
  linehl     = false,
  word_diff  = false,
  -- current_line_blame = true
})
