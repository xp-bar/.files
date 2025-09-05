local aug = require('xp-bar.autocommands.helpers').aug

aug('filetypes.md', function (au)
    au({'BufNewFile','BufRead'}, '*.md', function()
        vim.opt_local.spell = true
    end)
end)
