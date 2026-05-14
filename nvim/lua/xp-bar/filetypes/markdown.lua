local aug = require('xp-bar.autocommands.helpers').aug

-- markdown
aug('filetypes.md', function (au)
    au({'BufNewFile', 'BufRead'}, '*.md', function()
        vim.bo.filetype = 'markdown'
        vim.opt_local.spell = true

        local cmp = require('cmp')
        cmp.setup.buffer({
            mapping = cmp.mapping.preset.insert({
                ['<S-Tab>'] = cmp.mapping.complete()
            }),
            completion = {
                keyword_length = 4
            },
        })
    end)
end)

