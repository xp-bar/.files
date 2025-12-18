local helpers = require('xp-bar.plugins.configs.alpha-nvim.helpers')
local ascii = helpers.ascii
local text = helpers.text
local button = helpers.button
local file = helpers.edit_file_button
local group = helpers.group
local padding = helpers.padding
local hr = helpers.hr

local header = group({
    padding(1),
    text(ascii.hydra_small, { hl = 'xpDarkGray'}),
    text(ascii.xp_bar, { hl = 'xpCyan' }),
    text(ascii.neovim, { hl = 'xpRed' }),
})

local buttons = group({
    button('e', '   New file', ':enew<cr>'),
})

local bookmarks = group({
    file('.a', '~/.alias'),
    file('.f', '~/.function'),
    file('.v', '~/.config/nvim/init.lua'),
    file('.x', '~/.config/nvim/lua/xp-bar'),
    file('.t', '~/.tmux.conf'),
    file('.z', '~/.zshrc'),
    file('.d', '~/.antidote'),
    file('.h', ' .git/hooks/'),
}, {spacing = 0})

require('alpha').setup({
    ['layout'] = {
        padding(1),
        header,
        padding(1),
        hr('~-._.-~', 45),
        padding(2),
        buttons,
        bookmarks,
        padding(1),
        hr('_.-~-._', 45),
        padding(2),
        text({
            'In the beginning the Universe was created.',
            'This has made a lot of people very angry',
            'and been widely regarded as a bad move.',
            '',
            '                         -- Douglas Adams'
        }, {hl = {
            {{'xpLightGray', 0, 100}},
            {{'xpLightGray', 0, 100}},
            {{'xpLightGray', 0, 100}},
            {},
            {{'xpLightGray', 0, 100}},
        }}),
        text('~-._.-~', {hl = 'xpLightGray'}),
    },
    ['opts'] = {
        ['margin'] = 5,
    },
})
