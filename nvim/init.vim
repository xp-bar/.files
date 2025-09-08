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
set number numberwidth=4
set number relativenumber
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set conceallevel=0
set smartcase " for search, use smart casing, only works with ignorecase
set mousefocus
set mouse=a
set hidden
set shell=zsh
set tagcase=smart
set complete+=t
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldtext=nvim_treesitter#foldtext()
set nofoldenable
set foldlevel=0
set nowrap
set undofile
set colorcolumn=120
set path+=./**
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=**/vendor/**
set wildignore+=**/public/**
set noshowmode
set updatetime=300
set signcolumn=yes

" -- .editorconfig fallback options -- {{{
" overwritten by .editorconfig's 'indent_size'
set shiftwidth=4
set softtabstop=4

" overwritten by .editorconfig's 'indent_size' if 'indent_style' != 'tab' and
" 'indent_size' is not set.
set tabstop=4

" overwritten by .editorconfig's 'indent_style'
set expandtab
" --}}}

" Python 3 path for windows
if (has('macunix'))
    let g:python3_host_prog = '/usr/local/bin/python3'  " Python 3
elseif (has('unix') && substitute(system('which brew'), "\n", "", "") != "")
    let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'  " Python 3
endif

" PHP Neovim indentation options; sets arrow -> indentation back to classic
" behaviour instead of aligning
let g:PHP_noArrowMatching = 1

" OSX stupid backspace fix
set backspace=indent,eol,start

" Autoread files to watch for changes outside of vim
set autoread

" halve the wait time for multi-key keybinds
set ttm=25
" --- }}}

" --- General Settings --- {{{
" ---- General Mappings ---- {{{
map <Space> <leader>
nmap ,* *<C-O>:%s///gn<CR>
omap <silent> a- :normal Va-<cr>
nnoremap <silent><esc><esc> :set nopaste<cr>
vnoremap <silent> a- <esc>:setl nohlsearch<cr>?[^a-z-]<cr>:normal! ebmk<cr>/[^a-z-]<cr>:normal! beml<cr>:setl hlsearch \| noh<cr>`kv`l

" change between parens
onoremap in( :<c-u>normal! f(vi(<cr>

" abbreviations
cnoreabbrev ww setl wrap!|setl lbr!
cnoreabbrev Qa qa
cnoreabbrev QA qa

" ----- Buffers ----- {{{
" Nicer buffer closing
Plug 'moll/vim-bbye'
nnoremap <leader>q :Bdelete<cr>

" Buffer switching
nnoremap <silent> <S-j> :bnext<cr>
nnoremap <silent> <S-k> :bprev<cr>
" ----- }}}

" ----- Splits ----- {{{
nnoremap <leader>\| :vsp<cr>
nnoremap <leader>_ :sp<cr>
vnoremap <leader>\| :vsp<cr>
vnoremap <leader>_ :sp<cr>
" ----- }}}

" Stop using the Arrow keys in normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Stop using C-q for visual block, use <C-v>
nnoremap <C-q> <nop>

" Map Leader space to commands
noremap <leader><Space> :

" Unbind <esc>
inoremap <esc> <nop>
" Use jk instead of <esc> 
inoremap jk <esc>
vnoremap jk <esc>

" Clear highlight after search
nnoremap <silent><cr> :noh<CR><CR>:<backspace>

nnoremap <leader>w :w<cr>
vnoremap <leader>s :sort<cr>
" ---- }}}

" ---- Movement and resizing ---- {{{

" Resize window
noremap <C-w><C-Up> :res +5<cr> 
noremap <C-w><C-Down> :res -5<cr> 
noremap <C-w><C-Left> :vert res +5<cr>
noremap <C-w><C-Right> :vert res -5<cr>

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

"goto brace
nnoremap gb %
vnoremap gb %

nnoremap <C-f> /
vnoremap <C-f> y /<C-r>"

" Easy Align
Plug 'junegunn/vim-easy-align'
" ---- }}}

" ---- Auto Commands ---- {{{
let g:format_html = v:false

function! s:format_html()
    if (g:format_html)
        normal gg=G
    endif
endfunction

augroup buffercmds 
    autocmd!
    " Auto allow folds in vimrc file
    autocmd BufNewFile,BufRead .vimrc :setlocal foldlevelstart=0
    
    " Indent HTML files on save
    autocmd BufWritePre *.html :call s:format_html()
    
    " No linewrap html
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    
    autocmd Filetype diff setlocal foldlevel=1000
augroup END

augroup autoreload
    autocmd!
    " Thanks, Stack Overflow: https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
     autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
" ---- }}}

" ---- Typewriter mode: follow the cursor ---- {{{
nnoremap <leader>tt :call TypeWriterToggle()<cr>

function! TypeWriterToggle()
    if &scrolloff ==# "0"
        :set scrolloff=99
        :set sidescrolloff=99
    else
        :set scrolloff=0
        :set sidescrolloff=0
    endif
endfunction
" ---- }}}

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
" ---- }}}
" --- }}}

" --- User Interface --- {{{

" -- Startify
Plug 'mhinz/vim-startify'

" -- Switch to absolute numbering when losing focus for a buffer -- {{{
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" -- }}}

" -- Visual marks -- {{{
Plug 'kshenoy/vim-signature'
"  }}}

" -- fzf-lua -- {{{
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" }}}

" ---- Sidebar NERDTree ---- {{{
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
        
" Git File marking for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

Plug 'lewis6991/gitsigns.nvim'

" --- Coloured Icon Support (dependency of multiple plugins) --- {{{
Plug 'nvim-tree/nvim-web-devicons'
" --- }}}

" --- Goyo --- {{{
Plug 'junegunn/goyo.vim', {'for': 'markdown', 'on': 'Goyo'}
let g:goyo_width = 120
nnoremap <silent><leader>y :Goyo \| call buftabline#update(0)<cr>
" --- }}}
"
" --- Indentation Markers --- {{{
Plug 'lukas-reineke/indent-blankline.nvim'
" --- }}}

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

" Documentation Keybinds (pdv, vim-jsdoc)
augroup documentors
    autocmd!
    " autocmd FileType php nnoremap <silent> <leader>d :call pdv#DocumentCurrentLine()<cr> 
    autocmd FileType vue nmap <silent> <leader>d <Plug>(jsdoc)
    autocmd FileType javascript nmap <silent> <leader>d <Plug>(jsdoc)
augroup END

" ---- }}}

command! WebpackImport call vue#snippets#webpack_async_import()
command! Vue call vue#snippets#vue_files()
command! Mutator call vue#snippets#set_mutator()
command! Getter call vue#snippets#get_getter()

set omnifunc=v:lua.vim.lsp.omnifunc

augroup syntaxcommands
    autocmd!
    " Filetype autocmds
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType sass setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript setlocal makeprg=eslint\ --format=unix\ $*\ %

    " New file and Read automds
    autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
    autocmd BufNewFile,BufRead *.blade.php setlocal filetype=blade.php
    autocmd BufNewFile,BufRead *.dbml set syntax=dbml
    autocmd BufEnter,BufRead,BufNewFile *.vue set filetype=vue
    autocmd BufNewFile,BufRead *.html set filetype=html.handlebars
    autocmd BufNewFile,BufRead *.volt set filetype=volt
    autocmd BufNewFile,BufRead *.zep set filetype=zephir
augroup END
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

" autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

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
" ---- PHP ---- {{{
augroup phpImports
    autocmd!
    let errorformat =
            \ '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity%.%#,'.
            \ '"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-]\,%*[0-9]%.%#'
    autocmd FileType php setlocal commentstring=//%s
    autocmd FileType php setlocal makeprg=phpcs\ $*\ --report=csv\ --standard=XpBar\ -n\ %
    autocmd FileType php let &errorformat=errorformat
augroup END
" ---- }}}

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
