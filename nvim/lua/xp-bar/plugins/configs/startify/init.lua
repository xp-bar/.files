-- startify.lua
-- vim: set ts=2 sw=2:

local helpers = require('xp-bar.plugins.configs.startify.helpers')
local git_branch = require('xp-bar.plugins.helpers').git.branch
local git_diff = require('xp-bar.plugins.helpers').git.diff
local git_untracked = require('xp-bar.plugins.helpers').git.untracked

local homepage_lists = {
  ['Untracked Files'] = git_untracked,
  ['Changed Files on: ' .. git_branch()] = git_diff,
  ['Most recently used:'] = 'dir',
  ['Bookmarks'] = 'bookmarks',
}

vim.g.startify_bookmarks = {
   {['~'] = '~/'},
   {['.a'] = '~/.alias'},
   {['.f'] = '~/.function'},
   {['.v'] = '~/.config/nvim/init.vim'},
   {['.x'] = '~/.config/nvim/lua/xp-bar.lua'},
   {['.t'] = '~/.tmux.conf'},
   {['.z'] = '~/.zshrc'},
   {['.ax'] = '~/.antidote'},
   {['.h'] = '.git/hooks/'},
}

vim.g.toilet_font_dir = '~/.config/figlet/fonts/'
vim.g.startify_custom_header = helpers.get_header()
vim.g.startify_custom_footer = helpers.get_footer()
vim.g.startify_lists = helpers.startify_lists(homepage_lists)
