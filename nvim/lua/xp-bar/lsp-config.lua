-- xp-lsp-config.lua
-- vim: set ts=2 sw=2:

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.3',
        path = {
          '?.lua',
          '?/init.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
          '/usr/share/5.3/?.lua',
          '/usr/share/lua/5.3/?/init.lua'
        }
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.expand'~/.luarocks/share/lua/5.3',
          '/usr/share/lua/5.3',
          '${3rd}/love2d/library'
        }
      }
    }
  }
})

vim.lsp.enable('ts_ls')
vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = (os.getenv('NVM_BIN') or '') .. '/../lib/@vue/typescript-plugin',
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },
})

vim.lsp.enable('vue_ls')
vim.lsp.config('vue_ls', {
  capabilities = capabilities,
  cmd = { "pnpm", "vue-language-server", "--stdio" },
  filetypes = { 'vue' },
})

vim.lsp.enable('html')
vim.lsp.config('html', {
  capabilities = capabilities,
  filetypes = {
    'html',
    'vue'
  },
})

-- vim.lsp.enable('cssls')
-- vim.lsp.config('cssls', {
--   capabilities = capabilities,
-- })
--
-- vim.lsp.enable('cssmodules_ls')
-- vim.lsp.config('cssmodules_ls', {
--   capabilities = capabilities,
-- })
vim.lsp.enable('somesass_ls')
vim.lsp.config('somesass_ls', {
  capabilities = capabilities,
  filetypes = {
    'css',
    'sass',
    'scss',
    'vue'
  },
})
-- vim.lsp.enable('ruby_lsp')
-- vim.lsp.config('ruby_lsp', {
--   capabilities = capabilities,
-- })

vim.lsp.enable('solargraph')
vim.lsp.config('solargraph', {
  capabilities = capabilities,
  init_options = {
    formatting = false
  },
  settings = {
    solargraph = {
      diagnostics = false
    }
  }
})

-- vim.lsp.enable('sorbet')
-- vim.lsp.config('sorbet', {
--   capabilities = capabilities,
-- })

vim.lsp.enable('intelephense')
vim.lsp.config('intelephense', {
  capabilities = capabilities,
  init_options = {
    licenceKey = (os.getenv('INTELEPHENSE_LICENSE_KEY') or ''),
  },
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          -- NOTE: this needs to be setup separately; is a separate Laravel install w/ stubs
          os.getenv('HOME') .. '/Code/laravel-stubs'
        }
      }
    }
  }
})

vim.diagnostic.config({
  virtual_text = true,
})

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
