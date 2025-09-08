local aug = require('xp-bar.autocommands.helpers').aug

-- Typescript
aug('filetypes.typescript', function (au)
    au({'BufNewFile', 'BufRead'}, '*.ts', function()
        vim.bo.filetype = 'typescript'
    end)

    au({'Filetype'}, 'javascript', function()
        vim.o.makeprg = 'eslint'
    end)
end)

