-- xp-bar/plugins/vim-easy-align.lua
-- vim: set ts=2 sw=2:

vim.g.easy_align_delimiters = {
    ['-'] = {
        ['pattern'] = '-'
    },
    ['>'] = {
        ['pattern'] = '>>\\|=>\\|->\\|>'
    },
    ['/'] = {
        ['pattern']         = '//\\+\\|/\\*\\|\\*/',
        ['delimiter_align'] = 'l',
        ['ignore_groups']   = {'!Comment'}
    },
    [']'] = {
        ['pattern']       = '[[\\]]',
        ['left_margin']   = 0,
        ['right_margin']  = 0,
        ['stick_to_left'] = 0
    },
    [')'] = {
        ['pattern']       = '[()]',
        ['left_margin']   = 0,
        ['right_margin']  = 0,
        ['stick_to_left'] = 0
    },
    ['d'] = {
        ['pattern']      = ' \\(\\S\\+\\s*[;=]\\)\\@=',
        ['left_margin']  = 0,
        ['right_margin'] = 0
    }
}

-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)<cr>')
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)<cr>')
