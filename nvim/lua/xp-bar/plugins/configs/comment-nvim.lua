require('Comment').setup({
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = { line = '<C-_>', block = 'gbc' },
    opleader = { line = 'gc', block = 'gb' },
    extra = { above = 'gcO', below = 'gco', eol = 'gcA' },
    mappings = {
        basic = true, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        extra = true  -- Extra mapping; `gco`, `gcO`, `gcA`
    },
    pre_hook = nil,
    post_hook = nil,
})
