vim.o.autoindent     = true
vim.o.autoread       = true
vim.o.backspace      = 'indent,eol,start'
vim.o.colorcolumn    = '120'
vim.o.complete       = '.,w,b,u,t'
vim.o.conceallevel   = 0
vim.o.foldenable     = false
vim.o.foldlevel      = 0
vim.o.foldmethod     = 'expr'
vim.o.hidden         = true
vim.o.mouse          = "a"
vim.o.mousefocus     = true
vim.o.number         = true
vim.o.numberwidth    = 4
vim.o.omnifunc       = 'v:lua.vim.lsp.omnifunc'
vim.o.relativenumber = true
vim.o.shell          = "zsh"
vim.o.shiftround     = true
vim.o.showmode       = false
vim.o.signcolumn     = 'yes'
vim.o.smartcase      = true
vim.o.tagcase        = "smart"
vim.o.ttm            = 25
vim.o.undofile       = true
vim.o.updatetime     = 300
vim.o.wildmenu       = true
vim.o.wrap           = false
vim.wo.foldexpr      = 'v:lua.vim.treesitter.foldexpr()'

-- not quite sure how to move over yet --
-- vim.o.path           += './**'
-- vim.o.wildignore     += **/node_modules/**
-- vim.o.wildignore     += **/vendor/**
-- vim.o.wildignore     += **/public/**

-- .editorconfig fallback options --
vim.o.expandtab      = true
vim.o.shiftwidth     = 4
vim.o.softtabstop    = 4
vim.o.tabstop        = 4

