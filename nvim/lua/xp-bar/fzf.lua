-- xp-bar/fzf.lua
-- vim: set ts=2 sw=2:
--
-- My fzf config.

local actions = require "fzf-lua.actions"
require('fzf-lua').setup({'default',
  win_opts = {
    preview = {
      default = "bat"
    }
  },
  fzf_opts = {
    ['--layout'] = false,
  },
  fzf_colors = {
    ["bg"]      = "-1",
    ["fg"]      = "#5c6370",
    ["bg+"]     = "-1",
    ["fg+"]     = "#fefefe",
    ["pointer"] = "#e06c75",
    ["hl"]      = "#98c379",
    ["hl+"]     = "#98c379",
  },
  file_icons = false,
  actions = {
    files = {
      ["default"]     = actions.file_edit_or_qf,
      ["ctrl-s"]      = actions.file_split,
      ["ctrl-v"]      = actions.file_vsplit,
      ["ctrl-t"]      = actions.file_tabedit,
      -- ["alt-q"]       = actions.file_sel_to_qf,
      -- ["alt-l"]       = actions.file_sel_to_ll,
      ["ctrl-q"]       = actions.file_sel_to_qf,
      ["ctrl-l"]       = actions.file_sel_to_ll,
    },
    buffers = {
      -- providers that inherit these actions:
      --   buffers, tabs, lines, blines
      ["default"]     = actions.buf_edit,
      ["ctrl-s"]      = actions.buf_split,
      ["ctrl-v"]      = actions.buf_vsplit,
      ["ctrl-t"]      = actions.buf_tabedit,
    }
  },
  files = {
    previewer = 'bat',
    file_icons = false,
    RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH,
    toggle_ignore_flag = "--no-ignore",
    actions = {
      ["ctrl-g"] = { actions.toggle_ignore }
    }
  },
  grep = {
    actions = {
      ["ctrl-g"] = { actions.toggle_ignore },
      ["ctrl-r"] = { actions.grep_lgrep }
    },
  },
  lsp = {
    includeDeclaration = false,
    symbols = {
      -- false: disable, 1: icon+kind, 2: icon only, 3: kind only
      symbol_style = 3
    },
    -- actions = {
    --   ["default"] = actions.file_edit_or_qf
    -- }
  }
})

local grep_project = require"fzf-lua.providers.grep".grep_project
vim.api.nvim_create_user_command('Rg', function (args)
  local paths = {}

  for k, a in pairs(args.fargs) do
    if not a:find('^%-') then
      table.insert(paths, a)
    end
  end

  local opts = {
    search_paths = paths
  }

  grep_project(opts)
end, {
  nargs = '*',
  complete = 'file'
})

local git_diff = require"fzf-lua.providers.git".diff
vim.api.nvim_create_user_command('Diff', function (args)
  local a = args.args
  local ref = (a and string.len(a) > 0) and args.args or 'HEAD'

  git_diff({ref = ref})
end, {
    bang = true,
    nargs = '?',
    complete  = function (arglead, cmdline, cursorpos)
      local cmd = 'git branch'
      if string.len(arglead) > 0 then
        cmd = cmd .. ' -l ' .. arglead
      end

      local output = vim.fn.system(cmd)
      local branches = {}
      for s in output:gmatch("[^\r\n]+") do
        local branch = s:gsub("%s+", "")
        if not branch:find("^*") then
          table.insert(branches, branch)
        end
      end

      return branches
    end
})
