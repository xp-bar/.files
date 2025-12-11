local aug = require('xp-bar.autocommands.helpers').aug
require('conform').setup({
    formatters_by_ft = {
        javascript = {'prettier', stop_after_first = true},
        typescript = {'prettier', stop_after_first = true},
        typescriptreact = {'prettier', stop_after_first = true},
    },
});

aug('prettierfix', function (au)
    au({'BufWritePre'}, '*.tsx,*.ts,*.mjs,*.js', function (args)
        require("conform").format({ bufnr = args.buf })
    end)
end)
