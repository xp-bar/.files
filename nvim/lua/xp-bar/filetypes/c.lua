local aug = require('xp-bar.autocommands.helpers').aug

-- C
aug('filetypes.c', function (au)
    au({'BufNewFile', 'BufRead'}, '*.zep', function()
        vim.bo.filetype = 'zephir'
    end)
end)
