require('Comment').setup({
    padding = true,
    sticky = true,
    ignore = nil,
    -- toggler = { line = '<C-_>', block = 'gbc' },
    opleader = { line = 'gc', block = 'gb' },
    extra = { above = 'gcO', below = 'gco', eol = 'gcA' },
    mappings = {
        -- we don't technically need `basic` since they're builtin
        basic = false, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        -- but the other motions are nice
        extra = true  -- Extra mapping; `gco`, `gcO`, `gcA`
    },
    pre_hook = nil,
    post_hook = nil,
})

vim.keymap.set({'n', 'v'}, '<C-_>', ':normal gcc<cr>', {silent = true})
