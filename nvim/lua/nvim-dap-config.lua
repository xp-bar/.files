-- vim: set ts=2 sw=2:
local function load_dap()
  local ok, dap = pcall(require, 'dap')
  assert(ok, 'nvim-dap could not be loaded')
  return dap
end

local dap = load_dap()

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/Code/.files/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    name = 'Listen for Xdebug',
    type = 'php',
    request = 'launch',
    -- hostname = 'host.docker.internal',
    port = 9003,
    pathMappings = {
        ['/var/www/jbx'] = '${workspaceFolder}'
    },
    log = true
  }
}

vim.keymap.set('n', '<leader>dk', function() dap.continue() end)
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)

require("dapui").setup()
