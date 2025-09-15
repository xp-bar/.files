require('Navigator').setup({
    disable_on_zoom = true,
})

for direction, key in pairs({
    Up = "k",
    Left = "h",
    Right = "l",
    Down = "j"
}) do
    vim.keymap.set("n", "<C-"..key..">", "<cmd>Navigator"..direction.."<CR>", {silent = true})
end
