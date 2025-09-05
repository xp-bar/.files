-- xp-bar/plugins/vim-tmux-navigator.lua
-- vim: set ts=2 sw=2:

local flatten = require('xp-bar.plugins.helpers').flatten

local docker_transform = function (cmd)
    print('here!')
    local fpath = vim.fn.findfile("Dockerfile.dev", ";~/Code/")
    fpath = fpath:gsub("Dockerfile%.dev", '')

    return 'docker-compose --project-directory="'
        .. fpath
        .. '" exec core-app '
        .. cmd
end

local config = {
    ['neovim'] = {
        ['term_position'] = 'vert botright',
    },
    ['test'] = {
        ['transformation'] = 'docker',
        ['__custom_transformations'] = {
            ['docker'] = docker_transform
        },
        ['strategy'] = 'neovim',
        ['php'] = {
            ['phpunit'] = {
                ['executable'] = './vendor/bin/phpunit',
                ['__options'] = {
                    ['nearest'] = '-d memory_limit=2G --colors=always --testdox',
                    ['file']    = '-d memory_limit=2G --colors=always --testdox',
                    ['suite']   = '-d memory_limit=2G --testdox',
                }
            }
        },
        ['ruby'] = {
            ['rails'] = {
                ['__options'] = {
                    ['nearest'] = '-vp',
                    ['file']    = '-vp',
                    ['suite']   = '-vp',
                }
            }
        }
    }
}

for key, value in pairs(flatten(config)) do
    vim.g[key] = value
end

vim.keymap.set('n', '<leader>tn', '<cmd>TestNearest<cr>', {silent = true, remap = false})
vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<cr>', {silent = true, remap = false})
vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite<cr>', {silent = true, remap = false})
vim.keymap.set('n', '<leader>t.', '<cmd>TestLast<cr>', {silent = true, remap = false})
vim.keymap.set('n', '<leader>td', '<cmd>TestVisit<cr>', {silent = true, remap = false})
