local aug = require('xp-bar.autocommands.helpers').aug

-- Vue.js
aug('filetypes.vue', function (au)
    au({'BufNewFile', 'BufRead'}, '*.vue', function()
        vim.bo.filetype = 'vue'
    end)

    au({'Filetype'}, 'vue', function()
        vim.o.makeprg = 'eslint'
        vim.keymap.set('n', '<leader>d', '<Plug>(jsdoc)', {silent = true})
    end)
end)

