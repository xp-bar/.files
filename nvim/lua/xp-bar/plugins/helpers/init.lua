local M = {}

function M.tostring(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. M.tostring(v) .. ', '
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

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

function M.filter(list, func)
    local result = {}
    for key, value in pairs(list) do
        if (func(value, key)) then
            result[key] = value
        end
    end

    return result
end

function M.keys(list)
    local keys={}
    local n=0

    for k,v in pairs(list) do
        n=n+1
        keys[n]=k
    end

    return keys
end

function M.flatten(item, key, result)
    key = key or ''
    result = result or {}

    if type(item) == 'table' then
        for k, v in pairs(item) do
            -- if the key of an item starts with __, don't flatten it
            if k:find('^%_%_') then
                key = key:gsub('^%#', '')
                result[key .. "#" .. k:gsub('^%_%_', '')] = item[k]
            else
                M.flatten(v, key .. "#" .. k, result)
            end
        end
    else
        key = key:gsub('^%#', '')
        result[key] = item
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

M.plugins = {}

function M.plugins.start(opts)
    opts = opts or nil
    vim.call("plug#begin", opts)
end

function M.plugins.finish()
    vim.call("plug#end")
end

function M.plugins.install(plugin, opts)
    if opts then
        vim.fn['plug#'](plugin, opts)
    else
        vim.fn['plug#'](plugin)
    end
end

return M
