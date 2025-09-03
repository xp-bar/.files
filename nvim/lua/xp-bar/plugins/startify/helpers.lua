local round = require('xp-bar.plugins.helpers').round
local map = require('xp-bar.plugins.helpers').map

local M = {}
local columns = vim.fn.winwidth(0)

local function add_spacing(line)
    return "   " .. line
end

function M.get_header()
  return map(
        vim.fn.systemlist(
            'fortune -s -n ' .. round(columns / 6) ..' computers |'
            .. 'toilet -d ' .. vim.g.toilet_font_dir .. ' -f "Stick Letters" '
            .. '-w ' .. (columns)
        ),
        add_spacing
    )
end

function M.get_footer()
    return map(
        vim.fn.systemlist(
        'fortune -n 100 -l computers | cowsay -W ' .. round(columns / 2) .. ' -f tux'
        ),
        add_spacing
    )
end

function M.map_bookmarks(bookmarks)
    local mapped_bookmarks = {}
    for shortcut, path in pairs(bookmarks) do
        -- Each bookmark entry must be it's own list

        table.insert(mapped_bookmarks, {[shortcut] = path})
    end

    return mapped_bookmarks
end

function M.map_lines_to_startify_list(lines)
    return map(lines, function (line) return {
        line = line,
        cmd = "edit " .. line
    } end)
end

function M.startify_lists(lists)
    local result = {}
    for key, value in pairs(lists) do
        local t = value

        if type(value) == 'table' then
            t = function()
                return M.map_lines_to_startify_list(value)
            end
        end

        if type(value) == 'function' then
            local e, r = pcall(value)
            t = function()
                return M.map_lines_to_startify_list(r)
            end
        end

        table.insert(result, {
            ['header'] = {add_spacing(key)},
            ['type'] = t
        })
    end

    return result
end

return M
