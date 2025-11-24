-- xp-bar/fzf.lua
-- vim: set ts=2 sw=2:
--
-- My fzf config.

local colors = require('xp-bar.modules.colors').colors
local actions = require "fzf-lua.actions"
local filter = require('xp-bar.plugins.helpers').filter
local git_diff = require"fzf-lua.providers.git".diff
local grep_project = require"fzf-lua.providers.grep".grep_project
local map = require('xp-bar.plugins.helpers').map

require('fzf-lua').setup({'default',
  winopts = {
    preview = {
      default = "bat",
      vertical = "up:70%"
    }
  },
  fzf_opts = {
    ['--layout'] = false,
  },
  fzf_colors = {
    ["bg"]      = "-1",
    ["fg"]      = colors.paynes_grey_1,
    ["bg+"]     = "-1",
    ["fg+"]     = colors.french_grey,
    ["pointer"] = colors.red,
    ["hl"]      = colors.green,
    ["hl+"]     = colors.red,
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
  marks = {
    preview   = false,
    previewer = false,
    marks = "%a", -- filter vim marks with a lua pattern
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
    winopts = {
      preview = {
        layout = 'vertical'
      },
    },
  },
})

vim.keymap.set("n", "<C-p>", require('fzf-lua').files, {silent = true})
vim.keymap.set("n", "<M-p>", require('fzf-lua').buffers, {silent = true})
vim.keymap.set("n", "<leader>gd", require('fzf-lua').lsp_definitions, {silent = true})
vim.keymap.set("n", "<leader>gr", require('fzf-lua').lsp_references, {silent = true})
vim.keymap.set("n", "<leader>gk", require('fzf-lua').lsp_code_actions, {silent = true})
-- rename handled by native LSP
vim.keymap.set('n', '<leader>gi', require('fzf-lua').lsp_implementations, {silent = true})
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua<CR>")

vim.api.nvim_create_user_command('Marks', function (args)
  require('fzf-lua').marks({
    fzf_opts = {
      ['--multi'] = true
    }
  })
end, {})

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
 {'references',               '^r[eferences]*',                  fzfLua.lsp_references,             {}},
 {'definitions',              '^def[initions]*',                 fzfLua.lsp_definitions,            {}},
 {'declarations',             '^dec[larations]*',                fzfLua.lsp_declarations,           {}},
 {'types',                    '^t[ypes]*',                       fzfLua.lsp_typedefs,               {}},
 {'implementations',          '^im[plementations]*',             fzfLua.lsp_implementations,        {}},
 {'document symbols',         '^d[ocument]*[ ]*s[ymbols]*',      fzfLua.lsp_document_symbols,       {}},
 {'workspace symbols (live)', '^w[orkspace]*[ ]*s[ymbols]*',     fzfLua.lsp_live_workspace_symbols, {}},
 {'code actions',             '^c[ode actions]*',                fzfLua.lsp_code_actions,           {}},
 {'document diagnostics',     '^d[ocument]*[ ]*d[iagnostics]*',  fzfLua.lsp_document_diagnostics,   {winopts = {preview = {layout = 'vertical'}}}},
 {'workspace diagnostics',    '^w[orkspace]*[ ]*d[iagnostics]*', fzfLua.lsp_workspace_diagnostics,  {winopts = {preview = {layout = 'vertical'}}}},
}

local completions = map(cmd_map, function (l) return l[1] end);
vim.api.nvim_create_user_command('Lsp', function (cmd)
    for i, value in ipairs(cmd_map) do
      if cmd.args:match(value[2]) then
          return value[3](value[4])
      end
    end

    return require('fzf-lua').global()
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
