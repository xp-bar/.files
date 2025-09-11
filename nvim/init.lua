-- ===========================================
--
--          ▌        ▝▌   ▗    ▗▐    ▜
-- ▚▗▘▛▀▖▄▄▖▛▀▖▝▀▖▙▀▖▝▞▀▘ ▄ ▛▀▖▄▜▀   ▐ ▌ ▌▝▀▖
-- ▗▚ ▙▄▘   ▌ ▌▞▀▌▌   ▝▀▖ ▐ ▌ ▌▐▐ ▖▗▖▐ ▌ ▌▞▀▌
-- ▘ ▘▌     ▀▀ ▝▀▘▘   ▀▀  ▀▘▘ ▘▀▘▀ ▝▘ ▘▝▀▘▝▀▘
--
-- ===========================================

require('xp-bar.options')
require('xp-bar.mappings')
require('xp-bar.abbrev')
require('xp-bar.packs')

-- -- Set up plugins
require('xp-bar.plugins')

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

vim.cmd('syntax on')
