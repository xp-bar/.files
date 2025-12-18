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

M.text = function (value, opts)
    return {
        type = 'text',
        val = value,
        opts = table_with_default(opts, {position = 'center'})
    }
end

-- adapted from require('alpha.themes.startify').button
M.button = function (sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub('SPC', "<leader>")

    local opts = {
        position = 'center',
        shortcut = '[' .. sc .. '] ',
        cursor = 1,
        width = 50,
        align_shortcut = 'left',
        hl_shortcut = { { 'Operator', 0, 1 }, { 'Number', 1, #sc + 1 }, { 'Operator', #sc + 1, #sc + 2 } },
        shrink_margin = false,
    }
    if keybind then
        keybind_opts = table_with_default(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { 'n', sc_, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
        vim.api.nvim_feedkeys(key, 't', false)
    end

    return {
        type = 'button',
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

M.edit_file_button = function(sc, filepath)
    return M.button(sc, filepath, ':e '.. filepath .. '<CR>')
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
