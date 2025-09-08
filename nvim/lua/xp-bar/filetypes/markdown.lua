local aug = require('xp-bar.autocommands.helpers').aug

-- markdown
aug('filetypes.md', function (au)
    au({'BufNewFile', 'BufRead'}, '*.md', function()
        vim.bo.filetype = 'markdown'
        vim.opt_local.spell = true
    end)
end)

