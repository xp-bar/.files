return {
    html = {
        prefix = 'html',
        body = {
            '<!DOCTYPE html>',
            '<html lang="en">',
            '    <head>',
            '        <meta charset="utf-8">',
            '        <meta name="viewport" content="width=device-width, initial-scale=1.0">',
            '        <link rel="stylesheet" type="text/css" href="main.css">',
            '        <title>Document</title>',
            '    </head>',
            '    <body>',
            '        <header>',
            '        </header>',
            '        <main>',
            '        </main>',
            '        <footer>',
            '        </footer>',
            '        <script src="main.js"></script>',
            '    </body>',
            '</html>'
        },
    },
    stylesheet = {
        prefix = 'link',
        body = {
            '<link rel="stylesheet" type="text/css" href="main.css">'
        }
    },
    script = {
        prefix = 'script',
        body = {
            '<script src="main.js"></script>'
        }
    },
    php = {
        prefix = 'xphp',
        body = {
            '<?php',
            '',
            '?>',
        }
    },
    inline_php = {
        prefix = 'iphp',
        body = '<?php ?>',
    },
    short_php_echo = {
        prefix = 'xee',
        body = '<?= \\$var; ?>'
    },
    long_php_echo = {
        prefix = 'xeee',
        body = '<?php echo \\$var; ?>'
    }
}
