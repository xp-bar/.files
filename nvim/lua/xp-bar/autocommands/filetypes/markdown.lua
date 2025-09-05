local aug = require('xp-bar.autocommands.helpers').aug

aug('filetypes.md', '*.md', function (au)
    au({'BufNewFile','BufRead'}, function()
        vim.opt_local.spell = true
    end)
end)
