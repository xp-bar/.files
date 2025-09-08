local aug = require('xp-bar.autocommands.helpers').aug

-- PHP
aug('filetypes.php', function (au)
    au({'Filetype'}, 'php', function()
        vim.wo.foldlevel = 1000
    end)
    au({'BufNewFile','BufRead'}, '*.php', function()
        vim.wo.wrap = false
        vim.bo.filetype = 'php'
    end)
end)

-- CRONTAB
aug('filetypes.crontab', function (au)
    au({'Filetype'}, 'crontab', function()
        vim.opt_local.spell = true
    end)
end)

-- markdown
aug('filetypes.md', function (au)
    au({'BufNewFile','BufRead'}, '*.md', function()
        vim.opt_local.spell = true
    end)
end)
