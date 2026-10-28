local html = require('xp-bar.plugins.configs.mini.snippets.html')

return {
    html = html.html,
    -- script = html.script,
    -- stylesheet = html.stylesheet,
    ['Standalone PHP'] = {
        prefix = 'php',
        body = {
            '<?php',
            '',
            'declare(strict_types=1);',
            '',
            '',
        }
    },
    ['Short Echo'] = {
        prefix = 'ee',
        body = '<?= \\$var; ?>'
    },
    ['Long Echo'] = {
        prefix = 'eee',
        body = '<?php echo \\$var; ?>'
    }
}
