set nocompatible

call plug#begin('~/.vim/bundle')

" Only need to install for h: support
Plug 'junegunn/vim-plug'

" ._/"-._/"-._/"-._/"-._/"-._/"-._/"-._/"-._/"-._/"-._/"._/"._/"._/"._/"._/"-.
" ============================================================================
"
"                ▌ ▌▛▀▖   ▛▀▖▞▀▖▛▀▖▝▌▞▀▖    ▜▘▙ ▌▜▘▀▛▘ ▌ ▌▜▘▙▗▌
"                ▝▞ ▙▄▘▄▄▖▙▄▘▙▄▌▙▄▘▝ ▚▄     ▐ ▌▌▌▐  ▌  ▚▗▘▐ ▌▘▌
"                ▞▝▖▌     ▌ ▌▌ ▌▌▚   ▖ ▌    ▐ ▌▝▌▐  ▌▗▖▝▞ ▐ ▌ ▌
"                ▘ ▘▘     ▀▀ ▘ ▘▘ ▘  ▝▀     ▀▘▘ ▘▀▘ ▘▝▘ ▘ ▀▘▘ ▘
"
" ============================================================================
" ._/"-._/"-._/"-._/"-._/"-._/"-._/"-._/"-._/"-._/"-._/"._/"._/"._/"._/"._/"-.

" Nicer buffer closing
Plug 'moll/vim-bbye'

" Easy Align
Plug 'junegunn/vim-easy-align'

" Navigate Tmux and Vim Seamlessly
Plug 'christoomey/vim-tmux-navigator'
" --- }}}

" --- User Interface --- {{{

" -- Startify
Plug 'mhinz/vim-startify'

" -- Switch to absolute numbering when losing focus for a buffer
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" -- Visual marks
Plug 'kshenoy/vim-signature'

" -- fzf-lua
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

" ---- Sidebar NERDTree
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
        
" Git File marking for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

Plug 'lewis6991/gitsigns.nvim'

" --- Coloured Icon Support (dependency of multiple plugins)
Plug 'nvim-tree/nvim-web-devicons'

" --- Goyo
Plug 'junegunn/goyo.vim', {'for': 'markdown', 'on': 'Goyo'}
"
" --- Indentation Markers
Plug 'lukas-reineke/indent-blankline.nvim'

" }}}

" --- Syntax --- {{{

"  Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" NOTE: Need to replace these at some point, not supported in treesitter currently

" Plug 'mustache/vim-mustache-handlebars'
" Plug 'jyyan/vim-volt-syntax'
Plug 'fuyedong/vim-zephir'
" Plug 'jwalton512/vim-blade'

Plug 'dynamotn/tree-sitter-dbml'

" ---- Formatters / Documentation ---- {{{ 
" Prettier for JS
Plug 'prettier/vim-prettier', {'on': 'Prettier', 'for': ['javascript', 'vue', 'typescript']}

" JS Doc
Plug 'heavenshell/vim-jsdoc'
" ---- }}}
" }}}

" --- Language Servers, Linting and Testing --- {{{
" PHPCS Fixer
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php', 'on': 'PhpCsFixerFixFile'}

" -- LSP Setup -- {{{
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
" ---- }}}

" NVIM DAP (config in lua) and DAP UI
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'

" --- Editor Config --- {{{

" Aerial.nvim
Plug 'stevearc/aerial.nvim'

" Close all buffers except open one
Plug 'vim-scripts/BufOnly.vim'

" Tmux-style Pane Zooming
Plug 'dhruvasagar/vim-zoom'

" delimiter assistance
Plug 'Raimondi/delimitMate'

" Git wrapper for vim
Plug 'tpope/vim-fugitive'

" GV - git log browser
Plug 'junegunn/gv.vim'

" Managing quotations, surrounding brackets, etc. Made easier
Plug 'tpope/vim-surround'

" The missing motion - sneak
Plug 'justinmk/vim-sneak'

" Should keep me in root dir for commands like fzf
Plug 'airblade/vim-rooter'

" Emmet
Plug 'mattn/emmet-vim', {'for': ['html', 'vue', 'eruby', 'blade.php', 'typescriptreact']}

" Toggle line comments
Plug 'tpope/vim-commentary'

" --- }}}

" --- Language Config --- {{{
" Vim-test
Plug 'vim-test/vim-test', { 'for': [ 'php', 'ruby' ] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': function('mkdp#util#install')}

" Documentation stubs
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
" --- }}}

" --- Themimg --- {{{
Plug 'olimorris/onedarkpro.nvim'

syntax on

" ---- Lightline for Vim ---- {{{

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

let g:lightline = {
      \ 'colorscheme': 'two',
      \ 'active': {
      \   'left': [
      \       [ 'mode', 'paste' ],
      \       [ 'readonly', 'filename', 'modified' ]
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'percent' ],
      \     ['fileformat', 'fileencoding', 'filetype' ]
      \   ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ] ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'percent' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'mode': 'LightLineMode',
      \   'gitbranch': 'fugitive#head',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }

let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

" Used w/ `g:lightline#bufferline#clickable` to allow clickable tabs
let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#clickable = v:true
let g:lightline#bufferline#enable_devicons = v:true
let g:lightline#bufferline#min_buffer_count = 2

function! LightLineMode()
  return expand('%:t') ==# '__Tagbar__.1' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ expand('%:t') ==# 'startify' ? 'Startify' :
        \ expand('%:t') ==# 'NERD_tree' ? 'NERDTree' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction
" }}}

command! BufSync :execute 'bufdo :e' | source $VIMRUNTIME/syntax/syntax.vim
" }}}

" --- Remove user (plugin) commands I don't use --- {{{
function! s:clear_startify_commands()
    " ---- Startify ---- {{{
    delcommand SLoad
    delcommand SSave
    delcommand SDelete
    delcommand SClose
    delcommand StartifyDebug " may need to not delete this one for debug
    " ---- }}}

    delcommand Sexplore
endfunction

autocmd VimEnter * nested call s:clear_startify_commands()

" ===========================================================================

call plug#end()

" lua scripts
lua require('xp-bar')
