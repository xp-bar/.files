local aug = require('xp-bar.autocommands.helpers').aug

-- Javascript
aug('filetypes.javascript', function (au)
    au({'Filetype'}, 'javascript', function()
        vim.o.makeprg = 'eslint --format=unix $* ' .. vim.fn.expand('%')
        vim.keymap.set('n', '<leader>d', '<Plug>(jsdoc)', {silent = true})
    end)
end)

