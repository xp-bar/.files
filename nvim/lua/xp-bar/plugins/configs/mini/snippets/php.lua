local html = require('xp-bar.plugins.configs.mini.snippets.html')

return {
    html = html.html,
    -- script = html.script,
    -- stylesheet = html.stylesheet,
    php = {
        prefix = 'php',
        body = {
            '<?php',
            '',
            'declare(strict_types=1);',
            '',
            '',
        }
    },
}
