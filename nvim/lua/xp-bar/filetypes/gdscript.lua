local aug = require('xp-bar.autocommands.helpers').aug

-- gdscript
aug('filetypes.c', function (au)
    au({'BufNewFile', 'BufRead'}, {'*.gd', '*.gdscript', '*.gdscript3'}, function()
        -- vim.o.makeprg = p .. ' -m ' .. vim.fn.expand('%')
        vim.api.nvim_create_user_command('Godot', function ()
            local p = '/Applications/Godot.app/Contents/MacOS/Godot'
            local flags = {'-m'}
            local cmd = {
                'vert bo 80 split',
                '|',
                'terminal',
                p,
                table.concat(flags, ''),
                vim.fn.expand('%')
            }
            vim.cmd(table.concat(cmd, ' '))
            vim.cmd('startinsert')
        end, {})
    end)
end)
