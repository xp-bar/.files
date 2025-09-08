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

aug('yank', function (au)
    au({'TextYankPost'}, '*', function ()
        vim.highlight.on_yank {
            higroup="IncSearch",
            timeout=150,
            on_visual=true
        }
    end)
end)

aug('nvim.configfile', function (au)
    local pattern = '.vimrc, init.vim, init.lua'
    au({'BufNewFile', 'BufRead'}, pattern, function()
        vim.wo.foldlevelstart=0
    end)
end)

aug('autoreload', function (au)
    local cmd = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif"
    au({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, '*', cmd)

    au({'FileChangedShellPost'}, '*', function()
        vim.notify("File changed on disk; buffer reloaded.", vim.log.levels.WARN)
    end)
end)
