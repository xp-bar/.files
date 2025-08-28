-- xp-bar/vim-tmux-navigator.lua
-- vim: set ts=2 sw=2:

vim.g.tmux_navigator_no_mappings = true
vim.g.tmux_navigator_disable_when_zoomed = true

for direction, key in pairs({
    Up = "k",
    Left = "h",
    Right = "l",
    Down = "j"
}) do
    vim.keymap.set("n", "<C-"..key..">", "<cmd>TmuxNavigate"..direction.."<CR>", {silent = true})
end
