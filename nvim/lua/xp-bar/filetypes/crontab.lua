local aug = require('xp-bar.autocommands.helpers').aug

-- CRONTAB
aug('filetypes.crontab', function (au)
    au({'Filetype'}, 'crontab', function()
        vim.opt_local.spell = true
    end)
end)
