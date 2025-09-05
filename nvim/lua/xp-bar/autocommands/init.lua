require('xp-bar.autocommands.filetypes')

local aug = require('xp-bar.autocommands.helpers').aug

-- Pop references when holding the cursor
aug('cursor hold functions', function (au)
    local pattern = '*.rb,*.php,*.js,*.vue,*.ts'

    au({'CursorHold', 'CursorHoldI'}, pattern, function()
        vim.lsp.buf.document_highlight()
    end)
    au({'CursorMoved'}, pattern, function()
        vim.lsp.buf.clear_references()
    end)
end)
