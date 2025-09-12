-- xp-bar/fzf.lua
-- vim: set ts=2 sw=2:
--
-- My fzf config.

local actions = require "fzf-lua.actions"
local filter = require('xp-bar.plugins.helpers').filter
local git_diff = require"fzf-lua.providers.git".diff
local grep_project = require"fzf-lua.providers.grep".grep_project
local keys = require('xp-bar.plugins.helpers').keys

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

local lsp_cmd_map = {
    ['references']            = 'lsp_references',
    ['definitions']           = 'lsp_definitions',
    ['decarations']           = 'lsp_declarations',
    ['types']                 = 'lsp_typedefs',
    ['implementations']       = 'lsp_implementations',
    ['document symbols']      = 'lsp_document_symbols',
    ['workspace symbols']     = 'lsp_workspace_symbols',
    ['code actions']          = 'lsp_code_actions',
    ['document diagnostics']  = 'lsp_document_diagnostics',
    ['workspace diagnostics'] = 'lsp_workspace_diagnostics',
    -- not using
    -- lsp_finder
    -- lsp_live_workspace_symbols
    -- lsp_incoming_calls
    -- lsp_outgoing_calls
}
local regexes = {
    ['^r[eferences]*']                  = 'references',
    ['^def[initions]*']                 = 'definitions',
    ['^dec[larations]*']                = 'declarations',
    ['^t[ypes]*']                       = 'types',
    ['^im[plementations]*']             = 'implementations',
    ['^d[ocument]*[ ]*s[ymbols]*']      = 'document symbols',
    ['^w[orkspace]*[ ]*s[ymbols]*']     = 'workspace symbols',
    ['^c[ode actions]*']                = 'code actions',
    ['^d[ocument]*[ ]*d[iagnostics]*']  = 'document diagnostics',
    ['^w[orkspace]*[ ]*d[iagnostics]*'] = 'workspace diagnostics',
}

local completions = keys(lsp_cmd_map);
vim.api.nvim_create_user_command('Lsp', function (cmd)
    local args = cmd.args

    for regex, l in pairs(regexes) do
        if args:match(regex) then
            local lsp_cmd = lsp_cmd_map[l] or nil
            -- swap to providers
            return require('fzf-lua')[lsp_cmd]()
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
                -- could use a rewrite
                local s, e = string.find(value, '^'..arglead)
                if s then return true end
                s, e = string.find(value, '[ ]'..arglead)
                if s then return true else return false end
            end)
        end
    end
})
