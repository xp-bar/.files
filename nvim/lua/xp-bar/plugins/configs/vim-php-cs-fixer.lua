local aug = require('xp-bar.autocommands.helpers').aug
local toggle = true

vim.g.php_cs_fixer_path = vim.fn.expand('$HOME') .. '/.php-cs-fixer.php'

aug('phpcsfix', function (au)
    au({'BufWritePost'}, '*.php', function ()
        if not toggle then return end
        vim.cmd('silent! call PhpCsFixerFixFile()')
    end)
end)

vim.api.nvim_create_user_command('PhpCsToggle', function ()
    if toggle then toggle = false else toggle = true end
end, {})
