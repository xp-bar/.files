local helpers = require('xp-bar.plugins.configs.alpha-nvim.helpers')
local ascii = helpers.ascii
local text = helpers.text
local native_button = helpers.native_button
local file = helpers.edit_file_button
local group = helpers.group
local padding = helpers.padding
local hr = helpers.hr

local header = group({
    padding(1),
    text(ascii.hydra_small, { hl = ascii.hydra_hl()}),
    text(ascii.xp_bar, { hl = 'xpCyan' }),
    text(ascii.neovim, { hl = 'xpRed' }),
}, {spacing = 1})

local buttons = group({
    native_button('e', ' <empty buffer>', ':enew<cr>')
})

local bookmarks = group({
    file('.a', '~/.alias'),
    file('.f', '~/.function'),
    file('.v', '~/.config/nvim/init.lua'),
    file('.x', '~/.config/nvim/lua/xp-bar'),
    file('.t', '~/.tmux.conf'),
    file('.z', '~/.zshrc'),
    file('.d', '~/.antidote'),
    file('.h', '.git/hooks'),
})

require('alpha').setup({
    ['layout'] = {
        padding(1),
        header,
        padding(1),
        hr('~-._.-~', 45),
        padding(2),
        buttons,
        padding(1),
        bookmarks,
        padding(1),
        native_button('q', ' <quit>', ':q<cr>'),
        padding(1),
        hr('_.-~-._', 45),
        padding(2),
        text({
            '"In the beginning the Universe was created.',
            ' This has made a lot of people very angry',
            ' and been widely regarded as a bad move."',
            '',
            '                         -- Douglas Adams'
        }, {hl = {
            {{'xpLightGray', 0, 100}},
            {{'xpLightGray', 0, 100}},
            {{'xpLightGray', 0, 100}},
            {},
            {{'xpLightGray', 0, 100}},
        }}),
        padding(1),
        text('~-._.-~', {hl = 'xpDarkGray'}),
    },
    ['opts'] = {
        ['margin'] = 5,
    },
})
