local helpers = require('xp-bar.plugins.configs.alpha-nvim.helpers')
local ascii = helpers.ascii
local text = helpers.text
local button = helpers.button
local file = helpers.edit_file_button
local group = helpers.group
local padding = helpers.padding
local hr = helpers.hr

local header = group({
    text(ascii.hydra_small, { hl = 'xpLightGray' }),
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
        "     -~'‾‾‾'~-",
        '   -           -',
        '--     ( o )     --',
        '   -           -',
        '      ~-._.-~',
        }, {hl = 'xpLightGray'}),
        padding(1),
        text('{{ BEWARE OF HYDRA }}', {hl = {
            {'xpLightBlack', 0, #'{{ '},
            {'xpDarkGray', #'{{ ', #'{{ beware of hydra'},
            {'xpLightBlack', #'{{ beware of hydra', #'{{ beware of hydra }}'},
        }}),
    },
    ['opts'] = {
        ['margin'] = 5,
    },
})
