return {
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
}
