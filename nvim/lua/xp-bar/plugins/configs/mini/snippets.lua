local gen_loader = require('mini.snippets').gen_loader

require('mini.snippets').setup({
    mappings = { expand = '', jump_next = '', jump_prev = '' },
    snippets = {
        gen_loader.from_lang()
    }
})
