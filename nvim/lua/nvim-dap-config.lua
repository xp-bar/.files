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

require("dapui").setup({
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = ""
    }
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = {"q", "<Esc>"}
    }
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "ﰂ",
    expanded = ""
  },
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25
        },
        {
          id = "breakpoints",
          size = 0.25
        },
        {
          id = "stacks",
          size = 0.25
        },
        {
          id = "watches",
          size = 0.25
        }
      },
      position = "left",
      size = 40
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5
        },
        {
          id = "console",
          size = 0.5
        }
      },
      position = "bottom",
      size = 10
    }
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
  render = {
    indent = 1,
    max_value_lines = 100
  }
})
