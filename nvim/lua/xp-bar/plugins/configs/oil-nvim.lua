require("oil").setup({
    keymaps = {
        -- ['q'] = { "actions.close", mode = "n" },
        --
        -- ["g?"] = { "actions.show_help", mode = "n" },
        -- ["<CR>"] = "actions.select",
        -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
        -- ["<C-p>"] = "actions.preview",
        -- ["<C-c>"] = { "actions.close", mode = "n" },
        -- ["<C-l>"] = "actions.refresh",
        -- ["-"] = { "actions.parent", mode = "n" },
        -- ["_"] = { "actions.open_cwd", mode = "n" },
        -- ["`"] = { "actions.cd", mode = "n" },
        -- ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        -- ["gs"] = { "actions.change_sort", mode = "n" },
        -- ["gx"] = "actions.open_external",
        -- ["g."] = { "actions.toggle_hidden", mode = "n" },
        -- ["g\\"] = { "actions.toggle_trash", mode = "n" },
        ["<C-v>"] = {
            callback = function()
                local oil = require('oil')
                oil.select({ vertical = true, close = true })
                -- vim.cmd.wincmd({ args = { "p" }})
                -- vim.cmd.wincmd({ args = { "q" }})
            end,
            desc = "select_vsplit",
            mode = "n"
        },
    },
    use_default_keymaps = false, -- default: true
    view_options = {
        show_hidden = true, -- default: false
        case_insensitive = true, -- default: false
        sort = {
            { "type", "asc" },
            { "name", "asc" },
        },
    },
    float = {
        -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = 0.8,
        max_height = 0.9,
        border = nil,
        win_options = {
            winblend = 0,
        },
        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
        preview_split = "right",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
            conf.border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" };
            conf.style = 'minimal'
            conf.footer = ' oil '
            conf.footer_pos = 'center'

            return conf
        end,
    },
})
