require('xp-bar.autocommands.filetypes')

local aug = require('xp-bar.autocommands.helpers').aug

-- Pop references when holding the cursor
aug('cursor hold functions', '*.rb,*.php,*.js,*.vue,*.ts', function (au)
    au({'CursorHold', 'CursorHoldI'}, function()
        vim.lsp.buf.document_highlight()
    end)
    au({'CursorMoved'}, function()
        vim.lsp.buf.clear_references()
    end)
end)
