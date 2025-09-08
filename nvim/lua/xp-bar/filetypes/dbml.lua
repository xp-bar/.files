local aug = require('xp-bar.autocommands.helpers').aug

-- dbml
aug('filetypes.dbml', function (au)
    au({'BufNewFile', 'BufRead'}, '*.dbml', function()
        vim.bo.filetype = 'dbml'
    end)
end)
