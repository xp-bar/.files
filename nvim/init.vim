set nocompatible

if has('linux') && (substitute(system('which brew'), "\n", "", "") != "")
    set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf " fzf unix
else
    set rtp+=/usr/local/opt/fzf " fzf mac
endif

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

" ---- Native Options ---- {{{
set path+=./**
set wildignore+=**/node_modules/**
set wildignore+=**/vendor/**
set wildignore+=**/public/**

" Python 3 path for windows
if (has('macunix'))
    let g:python3_host_prog = '/usr/local/bin/python3'  " Python 3
elseif (has('unix') && substitute(system('which brew'), "\n", "", "") != "")
    let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'  " Python 3
endif
" --- }}}

" --- General Settings ---
" abbreviations
cnoreabbrev ww setl wrap!|setl lbr!
cnoreabbrev Qa qa
cnoreabbrev QA qa

" Nicer buffer closing
Plug 'moll/vim-bbye'

" Easy Align
Plug 'junegunn/vim-easy-align'

" ---- Navigate Tmux and Vim Seamlessly ---- {{{
Plug 'christoomey/vim-tmux-navigator'
" ---- }}}

" ---- Custom Pack stuff  ---- {{{
packadd! xp-session
let g:sessions_dir = '~/vim-sessions/'

packadd! xp-where
packadd! xp-text-casing
packadd! xp-changed
packadd! xp-hidden
packadd! xp-unjoin
packadd! xp-typewriter-toggle
" ---- }}}
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
let g:jsdoc_allow_input_prompt=0
let g:jsdoc_enable_es6=1
let g:jsdoc_input_description=1
let g:jsdoc_return_description=0

" ---- }}}

command! WebpackImport call vue#snippets#webpack_async_import()
command! Vue call vue#snippets#vue_files()
command! Mutator call vue#snippets#set_mutator()
command! Getter call vue#snippets#get_getter()
" }}}

" --- Language Servers, Linting and Testing --- {{{

command! -nargs=* -complete=customlist,php#laravel#blade_list Blade call php#laravel#blade_files(<f-args>)

" ---- PHPCS Fixer ---- {{{
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php', 'on': 'PhpCsFixerFixFile'}

let g:phpcs_fix = v:true
let g:php_cs_fixer_config = "$HOME/.php-cs-fixer.php"

function! s:phpcs_fix()
    if (g:phpcs_fix)
        call PhpCsFixerFixFile()
    fi
endfunction

augroup phpcsfix
    autocmd!
    autocmd BufWritePost *.php silent! call s:phpcs_fix()
augroup END

" ---- }}}

" -- LSP Setup -- {{{
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

nmap <silent> <leader>ga :call php#laravel#goto_attribute()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        :lua vim.lsp.buf.hover()
    endif
endfunction

nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>
" ---- }}}

nnoremap <silent> <leader>gl :Lines<CR>

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
nnoremap <leader>+ :<C-u>call zoom#toggle()<cr>

" delimiter assistance
Plug 'Raimondi/delimitMate'

" Git wrapper for vim
Plug 'tpope/vim-fugitive'
nnoremap <silent><C-b> :Git blame<cr>

" GV - git log browser
Plug 'junegunn/gv.vim'

" Managing quotations, surrounding brackets, etc. Made easier
Plug 'tpope/vim-surround'

" The missing motion - sneak
Plug 'justinmk/vim-sneak'

" Should keep me in root dir for commands like fzf
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git']

" ---- Emmet ---- {{{
Plug 'mattn/emmet-vim', {'for': ['html', 'vue', 'eruby', 'blade.php', 'typescriptreact']}

let g:user_emmet_leader_key='<leader>' 
let g:user_emmet_mode='n'

inoremap <C-Return> <cr><cr><C-o>k<Tab>
" ---- }}}

" ---- Comment and Un-comment lines on the fly ---- {{{
Plug 'tpope/vim-commentary'
" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
" Vim recognizes C-_ as C-/, so control+/ will toggle comments
noremap <C-_> :Commentary<cr>
" ---- }}}

" --- }}}

" --- Language Config --- {{{
" Vim-test
Plug 'vim-test/vim-test', { 'for': [ 'php', 'ruby' ] }

" ---- Markdown ---- {{{
" Fork with latest version of mermaid
" Plug 'sherocktong/markdown-preview.nvim', {'for': 'markdown', 'do': function('mkdp#util#install')}
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': function('mkdp#util#install')}
let g:mkdp_markdown_css = '~/Code/.files/nvim/dependencies/markdown/custom.css'
" ---- }}}

" ---- Documentation stubs ---- {{{
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
let g:pdv_template_dir=expand($HOME) . "/.pdv-templates"
" ---- }}}
" --- }}}

" --- Themimg --- {{{
Plug 'olimorris/onedarkpro.nvim'

syntax on

if (has("termguicolors"))
    set termguicolors
else
    set notermguicolors
endif

" ---- Lightline for Vim ---- {{{

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

set showtabline=2

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
