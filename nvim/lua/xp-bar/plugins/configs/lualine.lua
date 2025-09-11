local custom_onedark = require'lualine.themes.onedark'

local modes = {'normal', 'insert', 'visual', 'replace', 'command', 'inactive'}
for i, mode in ipairs(modes) do
    custom_onedark[mode].c = custom_onedark[mode].c or { bg = ''}
    custom_onedark[mode].c.bg = ''
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_onedark,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
        {
          'buffers',
          -- see: https://github.com/nvim-lualine/lualine.nvim/issues/1294#issuecomment-2487409554
          cond = function()
            local cond = #vim.fn.getbufinfo { buflisted = 1 } > 1
            vim.opt.showtabline = cond and 2 or 1
            return cond
          end,
          buffers_color = {
            active = {bg = '#c678dd', fg = '#282c34'},
            inactive = {bg = '#282c34', fg = '#abb2bf'},
          }
        }
    },
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
