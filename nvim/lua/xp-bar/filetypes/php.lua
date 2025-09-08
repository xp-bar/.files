local aug = require('xp-bar.autocommands.helpers').aug

vim.g.PHP_noArrowMatching = true

-- PHP
aug('filetypes.php', function (au)
    au({'Filetype'}, 'php', function()
        vim.wo.foldlevel = 1000
        vim.bo.commentstring = '//%s'
        vim.bo.makeprg = 'phpcs $* --report=csv -n ' .. vim.fn.expand('%')
        vim.bo.errorformat = '%-GFile\\,Line\\,Column\\,Type\\,Message\\,Source\\,Severity%.%#,"%f"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,"%m"\\,%*[a-zA-Z0-9_.-]\\,%*[0-9]%.%#'
        -- vim.keymap.set('n', '<leader>d', '<cmd>call pdv#DocumentCurrentLine()<cr>', {silent = true})
    end)

    au({'BufNewFile', 'BufRead'}, '*.php', function()
        vim.wo.wrap = false
        vim.bo.filetype = 'php'
    end)

    au({'BufNewFile', 'BufRead'}, '*.blade.php', function()
        vim.bo.filetype = 'blade.php'
    end)

    au({'BufNewFile', 'BufRead'}, '*.volt', function()
        vim.bo.filetype = 'volt.php'
    end)
end)
