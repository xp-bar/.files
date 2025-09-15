local Plugins = require('xp-bar.plugins.helpers').plugins

Plugins.start('~/.vim/bundle')
Plugins.install('junegunn/vim-plug') -- plugin docs
Plugins.install('moll/vim-bbye') -- easier buffer closing
Plugins.install('junegunn/vim-easy-align') -- align around chars
Plugins.install('numToStr/Navigator.nvim') -- navigate panes tmux / nvim
Plugins.install('mhinz/vim-startify') -- start screen
Plugins.install('jeffkreeftmeijer/vim-numbertoggle') -- switch to abs numbering when losing focus
Plugins.install('kshenoy/vim-signature') -- visual mark helper
Plugins.install('ibhagwan/fzf-lua', {['branch'] = 'main'})
Plugins.install('preservim/nerdtree', { ['on'] = {'NERDTreeToggle', 'NERDTreeFind'} }) -- sidebar filetree
Plugins.install('Xuyuanp/nerdtree-git-plugin', { ['on'] = {'NERDTreeToggle', 'NERDTreeFind'} })
Plugins.install('lewis6991/gitsigns.nvim') -- git signs in the gutter
Plugins.install('nvim-tree/nvim-web-devicons') -- dependency for some plugins
Plugins.install('folke/zen-mode.nvim') -- focus mode
Plugins.install('folke/twilight.nvim') -- dim inactive portions of code
Plugins.install('lukas-reineke/indent-blankline.nvim') -- indentation markers
Plugins.install('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) -- treesitter
Plugins.install('fuyedong/vim-zephir') -- syntax for zephir
Plugins.install('dynamotn/tree-sitter-dbml') -- syntax for DBML
Plugins.install('prettier/vim-prettier', {['on'] = 'Prettier', ['for'] = {'javascript', 'vue', 'typescript'}}) -- formatters
Plugins.install('heavenshell/vim-jsdoc') -- JSDoc generation
Plugins.install('stephpy/vim-php-cs-fixer', {['for'] = 'php', ['on'] = 'PhpCsFixerFixFile'}) -- phpcs fixing
Plugins.install('neovim/nvim-lspconfig')
Plugins.install('hrsh7th/nvim-cmp')
Plugins.install('hrsh7th/cmp-nvim-lsp')
Plugins.install('mfussenegger/nvim-dap') -- debug adapter
Plugins.install('nvim-neotest/nvim-nio') -- debug adapter dependency
Plugins.install('rcarriga/nvim-dap-ui')  -- debug adapter viewer
Plugins.install('stevearc/aerial.nvim') -- symbols window and fzf search
Plugins.install('vim-scripts/BufOnly.vim') -- close all buffers except one
Plugins.install('dhruvasagar/vim-zoom') -- tmux-style pane zoom
Plugins.install('Raimondi/delimitMate') -- delimiter assistance
Plugins.install('tpope/vim-fugitive') -- git
Plugins.install('junegunn/gv.vim') -- git log browser
Plugins.install('tpope/vim-surround') -- surround a text object w/ chars
Plugins.install('ggandor/leap.nvim') -- extra movement motions
Plugins.install('airblade/vim-rooter') -- find project root
Plugins.install('mattn/emmet-vim', {['for'] = {'html', 'vue', 'eruby', 'blade.php', 'typescriptreact'}})
Plugins.install('numToStr/Comment.nvim') -- comments
Plugins.install('vim-test/vim-test', {['for'] = { 'php', 'ruby' } }) -- testing
Plugins.install('iamcco/markdown-preview.nvim', {['for'] = 'markdown', ['do'] = function() vim.fn['mkdp#util#install']() end})
Plugins.install('tobyS/vmustache') -- documentation stubs
Plugins.install('tobyS/pdv') -- documentation stubs
Plugins.install('olimorris/onedarkpro.nvim') -- theme
Plugins.install('nvim-lualine/lualine.nvim') -- bottom line and bufferline

Plugins.finish()

require('xp-bar.plugins.configs')
