local aug = require('xp-bar.autocommands.helpers').aug

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

-- C
aug('filetypes.c', function (au)
    au({'BufNewFile', 'BufRead'}, '*.zep', function()
        vim.bo.filetype = 'zephir'
    end)
end)

-- CRONTAB
aug('filetypes.crontab', function (au)
    au({'Filetype'}, 'crontab', function()
        vim.opt_local.spell = true
    end)
end)

-- dbml
aug('filetypes.dbml', function (au)
    au({'BufNewFile', 'BufRead'}, '*.dbml', function()
        vim.bo.filetype = 'dbml'
    end)
end)

-- markdown
aug('filetypes.md', function (au)
    au({'BufNewFile', 'BufRead'}, '*.md', function()
        vim.bo.filetype = 'markdown'
        vim.opt_local.spell = true
    end)
end)

-- Vue.js
aug('filetypes.vue', function (au)
    au({'BufNewFile', 'BufRead'}, '*.vue', function()
        vim.bo.filetype = 'vue'
    end)

    au({'Filetype'}, 'vue', function()
        vim.o.makeprg = 'eslint'
        vim.keymap.set('n', '<leader>d', '<Plug>(jsdoc)', {silent = true})
    end)
end)

-- Typescript
aug('filetypes.typescript', function (au)
    au({'BufNewFile', 'BufRead'}, '*.ts', function()
        vim.bo.filetype = 'typescript'
    end)

    au({'Filetype'}, 'javascript', function()
        vim.o.makeprg = 'eslint'
    end)
end)

-- Javascript
aug('filetypes.javascript', function (au)
    au({'Filetype'}, 'javascript', function()
        vim.o.makeprg = 'eslint --format=unix $* ' .. vim.fn.expand('%')
        vim.keymap.set('n', '<leader>d', '<Plug>(jsdoc)', {silent = true})
    end)
end)

-- HTML
aug('filetypes.html', function (au)
    au({'BufNewFile', 'BufRead'}, 'html', function()
        vim.wo.wrap = false
        vim.bo.filetype = 'html'
    end)
end)

-- Diff
aug('filetypes.diff', function (au)
    au({'Filetype'}, 'diff', function()
        vim.wo.foldlevel=1000
    end)
end)
