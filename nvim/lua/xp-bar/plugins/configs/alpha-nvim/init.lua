local helpers = require('xp-bar.plugins.configs.alpha-nvim.helpers')
local ascii = helpers.ascii
local field = helpers.field
local group = helpers.group
local padding = helpers.padding
local hr = helpers.hr

local header = group({
    field(ascii.hydra_big, {
        ['hl'] = 'xpLightGray',
    }),
    field(ascii.xp_bar, {
        ['hl'] = 'xpCyan',
    }),
    field(ascii.neovim, {
        ['hl'] = 'xpRed',
    }),
})

local buttons = group({})

require('alpha').setup({
    ['layout'] = {
        padding(1),
        header,
        hr('~-._.-~', 40),
        buttons,
    },
    ['opts'] = {
        ['margin'] = 5,
    },
})
