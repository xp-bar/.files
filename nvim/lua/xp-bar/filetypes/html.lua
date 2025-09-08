local aug = require('xp-bar.autocommands.helpers').aug

-- HTML
aug('filetypes.html', function (au)
    au({'BufNewFile', 'BufRead'}, 'html', function()
        vim.wo.wrap = false
        vim.bo.filetype = 'html'
    end)
end)
