local aug = require('xp-bar.autocommands.helpers').aug
require('conform').setup({
    formatters_by_ft = {
        javascript = {'prettier', stop_after_first = true},
        typescript = {'prettier', stop_after_first = true},
        typescriptreact = {'prettier', stop_after_first = true},
        php = {'php_cs_fixer', stop_after_first = true}
    },
    formatters = {
        php_cs_fixer = function (bufnr)
            local config_file = os.getenv('PHP_CS_CONFIG_FILE')
            if config_file then
                return {append_args = {'--config', config_file}}
            end

            return {}
        end
    }
});

aug('prettierfix', function (au)
    au({'BufWritePre'}, '*.tsx,*.ts,*.mjs,*.js', function (args)
        require("conform").format({ bufnr = args.buf })
    end)

    au({'BufWritePre'}, '*.php,*.blade.php', function (args)
        require("conform").format({ bufnr = args.buf })
    end)
end)
