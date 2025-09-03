local M = {}

function M.round(number)
    return math.floor(number+0.5)
end

function M.map(list, func)
    local result = {}
    for key, value in pairs(list) do
        result[key] = func(value, key)
    end

    return result
end

return M
