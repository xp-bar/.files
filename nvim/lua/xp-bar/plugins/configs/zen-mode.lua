require('zen-mode').setup({
    window = {
        backdrop = 1,
        options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            laststatus = 0 -- disable global statusline
        },
    },
    plugins = {
        twilight = true,
        gitsigns = true,
    },
})

vim.keymap.set({'n', 'v'}, '<leader>y', ':ZenMode<cr>', {silent = true})
