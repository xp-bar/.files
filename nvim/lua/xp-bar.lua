-- xp-bar.lua
-- vim: set ts=2 sw=2:
--
require('xp-bar.options')

-- require('xp-bar.nvim-dap-config')

-- Set up lspconfig.
require('xp-bar.lsp-config')

-- -- Set up treesitter.
require('xp-bar.treesitter')
require('xp-bar.theme')

-- -- autocommands
require('xp-bar.autocommands')

-- -- filetype-specific configs
require('xp-bar.filetypes')

-- -- Set up plugins
require('xp-bar.plugins')
