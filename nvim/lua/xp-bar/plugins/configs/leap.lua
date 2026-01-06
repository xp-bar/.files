vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
