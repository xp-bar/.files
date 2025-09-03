-- xp-bar/plugins/nerdtree/init.lua
-- vim: set ts=2 sw=2:
--
vim.g.NERDTreeHijackNetrw = true
vim.g.NERDTreeQuitOnOpen = true
vim.g.NERDTreeIgnore = {
    '.png$',
    '.jpg$',
    '.gif$',
    '.mp3$',
    '.flac$',
    '.ogg$',
    '.mp4$',
    '.avi$',
    '.webm$',
    '.mkv$',
    '.pdf$',
    '.zip$',
    '.tar.gz$',
    '.rar$',
    '.DS_Store$',
    '__.*$',
    '^ting.*.php',
}

vim.keymap.set("n", "<C-\\>", "<cmd>NERDTreeToggle<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>\\", "<cmd>NERDTreeFind<CR>", {noremap = true, silent = true})

require('xp-bar.plugins.nerdtree.git-plugin')
