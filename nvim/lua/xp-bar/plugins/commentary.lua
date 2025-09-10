-- https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
-- -- Vim recognizes C-_ as C-/, so control+/ will toggle comments
vim.keymap.set({'v', 'n'}, '<C-_>', ':Commentary<cr>')
