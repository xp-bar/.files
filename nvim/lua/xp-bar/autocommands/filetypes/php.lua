local aug = require('xp-bar.autocommands.helpers').aug

aug('filetypes.php', '*.php', function (au)
    au({'Filetype'}, function()
        vim.opt_local.foldlevel = 1000
    end)
    au({'BufNewFile','BufRead'}, function()
        vim.opt_local.nowrap = true
        vim.opt.filetype = 'php'
    end)
end)
