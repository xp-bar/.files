local M = {}
M.ascii = require('xp-bar.plugins.configs.alpha-nvim.helpers.ascii')

local table_with_default = function(opts, defaults)
    local result = defaults or {}
    for key, value in pairs(opts or {}) do
        result[key] = value
    end

    return result
end

M.group = function (fields, opts)
    return {
        type = 'group',
        val = fields,
        opts = table_with_default(opts, {spacing = 1})
    }
end

M.field = function (value, opts, type)
    return {
        type = type or 'text',
        val = value,
        opts = table_with_default(opts, {position = 'center'})
    }
end

M.padding = function (height)
    return {
        type = 'padding',
        val = height
    }
end

M.hr = function (characters, width, opts)
    width = width or 20

    local str = ''
    while string.len(str) < width do
        str = str..characters
    end

    return {
        type = 'text',
        val = str,
        opts = table_with_default(opts, {position = 'center', hl = 'xpDarkGray'})
    }
end

return M;
