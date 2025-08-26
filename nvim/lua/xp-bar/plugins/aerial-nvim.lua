local aerial = require('aerial')

aerial.setup({
    on_attach = function(bufnr)
        vim.keymap.set("n", "[t", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "]t", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    close_automatic_events = {},
    post_jump_cmd = false,
})

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<C-s>", "<cmd>AerialToggle!<CR>")

vim.api.nvim_create_user_command('FzfAerial', aerial.fzf_lua_picker, {})
vim.keymap.set("n", "<C-S>", "<cmd>FzfAerial<CR>")
