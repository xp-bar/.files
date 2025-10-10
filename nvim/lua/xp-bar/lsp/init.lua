local lsp_engines = {
    'lua_ls',
    'ts_ls',
    'vue_ls',
    'html',
    'somesass_ls',
    'solargraph',
    'intelephense',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _i, engine in ipairs(lsp_engines) do
    vim.lsp.enable(engine)
    local config = require('xp-bar.lsp.configs.' .. engine)
    if (config.capabilities == nil) then
        config.capabilities = capabilities
    end
    vim.lsp.config(engine, config)
end


vim.diagnostic.config({
  virtual_text = true,
})

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
