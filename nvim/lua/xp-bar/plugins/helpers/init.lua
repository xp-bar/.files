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

M.git = {}

function M.git.branch()
    return vim.fn.split(vim.fn.system('git rev-parse --abbrev-ref HEAD 2>/dev/null'), '\n', true)[1]
end

function M.git.diff()
    return vim.fn.systemlist('git --no-pager diff --name-only 2>/dev/null')
end

function M.git.untracked()
    return vim.fn.systemlist('git ls-files --others --exclude-standard 2>/dev/null')
end

return M
