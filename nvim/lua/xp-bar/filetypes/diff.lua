local aug = require('xp-bar.autocommands.helpers').aug

-- Diff
aug('filetypes.diff', function (au)
    au({'Filetype'}, 'diff', function()
        vim.wo.foldlevel=1000
    end)
end)
