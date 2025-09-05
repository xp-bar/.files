local M = {}

function M.aug(name, callback, options)
    options = options or {}
    local group = vim.api.nvim_create_augroup(name, options)

    callback(function(events, pattern, param)
        return M.au(events, group, pattern, param)
    end
)
end

function M.au(events, group, pattern, param)
    local o = {group = group, pattern = pattern}
    if (type(param) == 'function') then
        o.callback = param
    else
        o.command = param
    end

    vim.api.nvim_create_autocmd(events, o)
end

return M
