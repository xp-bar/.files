local lint = require('lint')

lint.linters_by_ft = {
    php = {'dphpstan'}
}

lint.linters.dphpstan = {
  cmd = 'docker-compose',
  stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
  append_fname = false, -- Automatically append the file name to `args` if `stdin = false` (default: true)
  args = {
    '--log-level',
    'ERROR',
    '--project-directory',
    function()
        local fpath = vim.fn.findfile("Dockerfile.dev", ";~/Code/")
        fpath = fpath:gsub("Dockerfile%.dev", '')
        return fpath
    end,
    'exec',
    function()
        return os.getenv('DOCKER_DEFAULT_APP') or error('DOCKER_DEFAULT_APP must be set!')
    end,
    './vendor/bin/phpstan',
    'analyze',
    '--error-format=json',
    '--no-progress',
    function ()
        -- original implementation of append_fname would do:
        -- return vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
        -- but we need the relative path
        return vim.fn.expand('%:p:.')
    end
  }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
  stream = 'stdout', -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
  ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
  parser = function(output, bufnr)
    if vim.trim(output) == '' or output == nil then
        return {}
    end

    local files = vim.json.decode(output).files
    local fileKey = nil

    -- we also needed the relative path here, but because it's containerized
    -- and there's a different container path (usually prefixed with /var/www/html/)
    -- we're matching instead of using the exact key
    for key, _data in pairs(files) do
        if fileKey ~= nil then
            goto continue
        end

        if (string.find(key, vim.fn.expand('%:p:.'))) then
            fileKey = key
        end

        ::continue::
    end

    if fileKey == nil then
        return {}
    end

    local file = files[fileKey]
    local diagnostics = {}

    for _, message in ipairs(file.messages or {}) do
        table.insert(diagnostics, {
            lnum = type(message.line) == 'number' and (message.line - 1) or 0,
            col = 0,
            message = message.message,
            source = 'phpstan',
            code = message.identifier,
        })
    end

    return diagnostics
    end
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
