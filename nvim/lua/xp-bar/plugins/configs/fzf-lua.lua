-- xp-bar/fzf.lua
-- vim: set ts=2 sw=2:
--
-- My fzf config.

local actions = require "fzf-lua.actions"
local filter = require('xp-bar.plugins.helpers').filter
local git_diff = require"fzf-lua.providers.git".diff
local grep_project = require"fzf-lua.providers.grep".grep_project
local map = require('xp-bar.plugins.helpers').map

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

vim.keymap.set("n", "<C-p>", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "<M-p>", "<cmd>FzfLua buffers<CR>")
-- goto definition handled by native LSP
vim.keymap.set("n", "<leader>gr", "<cmd>FzfLua lsp_references<CR>")
vim.keymap.set("n", "<leader>gk", "<cmd>FzfLua lsp_code_actions<CR>")
-- rename handled by native LSP

vim.keymap.set("n", "<leader>f", "<cmd>FzfLua<CR>")

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

vim.keymap.set('n', '<leader>gl', function()
  return require('fzf-lua').files()
end, {silent = true})

local fzfLua = require('fzf-lua')
local cmd_map = {
 {'references',            '^r[eferences]*',                  fzfLua.lsp_references},
 {'definitions',           '^def[initions]*',                 fzfLua.lsp_definitions},
 {'declarations',          '^dec[larations]*',                fzfLua.lsp_declarations},
 {'types',                 '^t[ypes]*',                       fzfLua.lsp_typedefs},
 {'implementations',       '^im[plementations]*',             fzfLua.lsp_implementations},
 {'document symbols',      '^d[ocument]*[ ]*s[ymbols]*',      fzfLua.lsp_document_symbols},
 {'workspace symbols',     '^w[orkspace]*[ ]*s[ymbols]*',     fzfLua.lsp_workspace_symbols},
 {'code actions',          '^c[ode actions]*',                fzfLua.lsp_code_actions},
 {'document diagnostics',  '^d[ocument]*[ ]*d[iagnostics]*',  fzfLua.lsp_document_diagnostics},
 {'workspace diagnostics', '^w[orkspace]*[ ]*d[iagnostics]*', fzfLua.lsp_workspace_diagnostics},
}

local completions = map(cmd_map, function (l) return l[1] end);
vim.api.nvim_create_user_command('Lsp', function (cmd)
    for i, value in ipairs(cmd_map) do
      if cmd.args:match(value[2]) then
          return value[3]()
      end
    end
end, {
    nargs = '*',
    range = '%',
    complete = function (arglead)
        if arglead == '' then
            return completions
        else
            return filter(completions, function (value, key)
                return string.find(value, '^'..arglead)
                  or string.find(value, '[ ]'..arglead)
            end)
        end
    end
})
