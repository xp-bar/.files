local NOP = '<nop>'

-- base mappings
vim.keymap.set('', '<space>', '<leader>', {remap = true})
vim.keymap.set('n', ',*', '*<C-o>:%s///gn<cr>', {remap = true})
vim.keymap.set('o', 'a-', ':normal Va-<cr>', {remap = true, silent = true})
vim.keymap.set('v', 'a-', '<esc>:setl nohlsearch<cr>?[^a-z-]<cr>:normal! ebmk<cr>/[^a-z-]<cr>:normal! beml<cr>:setl hlsearch \\| noh<cr>`kv`l', {silent = true})
vim.keymap.set('n', '<esc><esc>', ':set nopaste<cr>', {silent = true})

-- change between parens
vim.keymap.set('o', 'in(', ':<C-u>normal! f(vi(<cr>')

-- vim-bbye
vim.keymap.set('n', '<leader>q', ':Bdelete<cr>', {silent  = true})

-- navigate buffers
vim.keymap.set('n', '<S-j>', ':bnext<cr>', {silent = true})
vim.keymap.set('n', '<S-k>', ':bprev<cr>', {silent = true})

-- splits
vim.keymap.set({'n', 'v'}, '<leader>|', ':vsp<cr>', {silent = true})
vim.keymap.set({'n', 'v'}, '<leader>_', ':sp<cr>', {silent = true})

-- unset arrow keys in normal mode
vim.keymap.set('n', '<Up>', NOP)
vim.keymap.set('n', '<Down>', NOP)
vim.keymap.set('n', '<Left>', NOP)
vim.keymap.set('n', '<Right>', NOP)

-- unmap c-q for visual block, use c-v instead
vim.keymap.set('n', '<C-q>', NOP)

-- double leader = command prompt
vim.keymap.set('n', '<leader><space>', ':', {silent = true})

-- unbind <esc>
vim.keymap.set('i', '<esc>', NOP)
vim.keymap.set({'i', 'v'}, 'jk', '<esc>')

-- clear highlight after search
vim.keymap.set('n', '<cr>', ':noh<cr><cr>:<backspace>', {silent = true})

-- write
vim.keymap.set('n', '<leader>w', ':w<cr>')

-- sort lines
vim.keymap.set('v', '<leader>s', ':sort<cr>')

-- Resize window
vim.keymap.set('n', '<C-w><C-Up>', ':res +2<cr>')
vim.keymap.set('n', '<C-w><C-Down>', ':res -2<cr>')
vim.keymap.set('n', '<C-w><C-,>', ':vert res +2<cr>')
vim.keymap.set('n', '<C-w><C-.>', ':vert res -2<cr>')

-- shift lines indent levels in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- goto brace
vim.keymap.set({'n', 'v'}, 'gb', '%')

-- quick search
vim.keymap.set('n', '<C-f>', '/')

-- quick find selected range
vim.keymap.set('v', '<C-f>', 'y /<C-r>"')

-- ??? something I had mapped near emmet
vim.keymap.set('i', '<C-Return>', '<cr><cr><C-o>k<Tab>')
