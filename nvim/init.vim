" vim: set ts=2 sw=2:
set nocompatible              " be iMproved, required

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
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
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
set foldmethod=marker
set foldlevel=0
set nowrap
set undofile
set colorcolumn=120

set path+=./**
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=**/vendor/**
set wildignore+=**/public/**
" Hide -- INSERT --
set noshowmode

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" from: coc.nvim
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" from: coc.nvim
set signcolumn=yes

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

" ----- Easy Align ----- {{{
Plug 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\    '-': {
\        'pattern': '-'
\    },
\    '>': {
\        'pattern': '>>\|=>\|->\|>'
\    },
\    '/': {
\        'pattern':         '//\+\|/\*\|\*/',
\        'delimiter_align': 'l',
\        'ignore_groups':   ['!Comment']
\    },
\    ']': {
\        'pattern':       '[[\]]',
\        'left_margin':   0,
\        'right_margin':  0,
\        'stick_to_left': 0
\    },
\    ')': {
\        'pattern':       '[()]',
\        'left_margin':   0,
\        'right_margin':  0,
\        'stick_to_left': 0
\    },
\    'd': {
\        'pattern':      ' \(\S\+\s*[;=]\)\@=',
\        'left_margin':  0,
\        'right_margin': 0
\    }
\ }

" ----- }}}
" ---- }}}

" ---- Auto Commands ---- {{{
let g:format_html = v:false

function! s:format_html()
    if (g:format_html)
        normal gg=G
    endif
endfunction

function! s:trim_whitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup buffercmds 
    autocmd!
    " Auto allow folds in vimrc file
    autocmd BufNewFile,BufRead .vimrc :setlocal foldlevelstart=0
    
    " Indent HTML files on save
    autocmd BufWritePre *.html :call s:format_html()

    " trailing whitespace on save
    autocmd BufWritePre *.php :call s:trim_whitespace()
    autocmd BufWritePre *.md :call s:trim_whitespace()
    autocmd BufWritePre *.volt :call s:trim_whitespace()
    
    " No linewrap html
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    
    " Spellcheck Markdown 
    autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us
    
    " No linewrap html
    autocmd BufNewFile,BufRead *.php setlocal nowrap
    
    autocmd Filetype diff setlocal foldlevel=1000
    autocmd Filetype php setlocal foldlevel=1000
augroup END

augroup autoreload
    autocmd!
    " Thanks, Stack Overflow: https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
     autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
autocmd filetype crontab setlocal nobackup nowritebackup

autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
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
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
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

" ---- Startup Screen ---- {{{
Plug 'mhinz/vim-startify'
" Startify config
let g:startify_bookmarks = [
        \ {'~' : '~/'},
        \ {'.a' : '~/.alias'},
        \ {'.f' : '~/.function'},
        \ {'.v' : '~/.config/nvim/init.vim'},
        \ {'.x' : '~/.config/nvim/lua/xp-bar.lua'},
        \ {'.t' : '~/.tmux.conf'},
        \ {'.z' : '~/.zshrc'},
        \ {'.p' : '~/.zsh-plugins'},
        \ {'.h' : '.git/hooks/'},
        \ ]

function! s:vim_sessions()
    let files = systemlist('ls -1t ' . g:sessions_dir . ' | sed "s:.vim::g" | head -n 3')
    if v:shell_error != 0
        return []
    endif

    return map(files, '{
            \ "line": v:val,
            \  "cmd": "source " . g:sessions_dir . v:val . ".vim"
        \ }')
endfunction

function! s:changed_files()
    let files = systemlist('git --no-pager diff --name-only')
    if v:shell_error != 0
        return []
    endif

    return map(files, '{
            \ "line": v:val,
            \  "cmd": "edit ". v:val
        \ }')
endfunction

function! s:untracked_files()
    let files = systemlist('git ls-files --others --exclude-standard')
    if v:shell_error != 0
        return []
    endif

    return map(files, '{
            \ "line": v:val,
            \  "cmd": "edit ". v:val
        \ }')
endfunction


let g:startify_lists = [
        \ { 'header': ['   Untracked Files:'], 'type': function('s:untracked_files') },
        \ { 'header': ['   Changed Files on: ' . substitute(system('git rev-parse --abbrev-ref HEAD'), '\n', '', 'g')], 'type': function('s:changed_files') },
        \ { 'header': ['   Most Recently Used in '. getcwd()], 'type': 'dir' },
        \ { 'header': ['   Bookmarks'], 'type': 'bookmarks' },
        \ { 'header': ['   Recent Sessions:'], 'type': function('s:vim_sessions'), 'indices': map(range(1,5), '"s" . v:val')}
        \ ]

let g:toilet_font_dir = "~/.config/figlet/fonts/"

let g:startify_custom_header = 
            \ map(split(system('fortune -s -n $[$(tput cols)/4] computers | toilet -d ' . g:toilet_font_dir . ' -f "Stick Letters" -w $[$(tput cols) + 100]'), '\n'), '"   ". v:val')

let g:startify_custom_footer =
        \ map(
        \    split(
        \        system(
        \            'fortune -l computers | cowsay -W 80 -f tux'
        \        ),
        \        '\n'
        \    ),
        \    '"   ". v:val'
        \ )

nnoremap <leader><C-s> :Startify<cr>
"  }}}

" -- Switch to absolute numbering when losing focus for a buffer -- {{{
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" -- }}}

" -- Visual marks -- {{{
Plug 'kshenoy/vim-signature'
"  }}}

" -- fzf-lua -- {{{
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" optional for icon support
Plug 'nvim-tree/nvim-web-devicons'
" }}}

" ---- Sidebar NERDTree ---- {{{
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
noremap <silent> <C-\> :NERDTreeToggle<CR>
noremap <leader>\ :NERDTreeFind<CR>
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = [
        \ '\.png$',
        \ '\.jpg$',
        \ '\.gif$',
        \ '\.mp3$',
        \ '\.flac$',
        \ '\.ogg$',
        \ '\.mp4$',
        \ '\.avi$',
        \ '.webm$',
        \ '.mkv$',
        \ '\.pdf$',
        \ '\.zip$',
        \ '\.tar.gz$',
        \ '\.rar$',
        \ '\.DS_Store$',
        \ '__.*$',
        \ '^ting.*\.php',
        \ ]
        
" Git File marking for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Custom indicator mappings for nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ "Modified"  : "*",
        \ "Staged"    : "+",
        \ "Untracked" : "",
        \ "Renamed"   : ">",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "-",
        \ "Dirty"     : "~",
        \ "Clean"     : "",
        \ 'Ignored'   : '',
        \ "Unknown"   : ""
        \ }
"  }}}

" --- GitGutter --- {{{
Plug 'airblade/vim-gitgutter'

let g:gitgutter_highlight_linenrs = 1
" --- }}}

" --- Buftabline --- {{{
Plug 'ap/vim-buftabline'

" Only show if there are 2+ buffers open (0 = never, 1 = if buffers > 2, 2 = always)
let g:buftabline_show = 1

" Numbers beside buffers (0 = none, 1 = internal buffer number, 2 = ordinal)
let g:buftabline_number = 1

let g:buftabline_indicators = 1
" --- }}}

" --- Goyo --- {{{
Plug 'junegunn/goyo.vim', {'for': 'markdown', 'on': 'Goyo'}
let g:goyo_width = 120
nnoremap <silent><leader>y :Goyo \| call buftabline#update(0)<cr>
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

augroup syntaxcommands
    autocmd!
    " Filetype autocmds
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType sass setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType vue syntax sync fromstart
    autocmd FileType vue setlocal makeprg=eslint\ --format=unix\ $*\ %
    autocmd FileType javascript setlocal makeprg=eslint\ --format=unix\ $*\ %

    " New file and Read automds
    autocmd BufNewFile,BufRead *.php set filetype=php
    autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
    autocmd BufNewFile,BufRead *.blade.php setlocal filetype=blade
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
" -- }}}

" ---- Conquer of Completion {{{
Plug 'neoclide/coc.nvim', { 'do': function('coc#util#install') }

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
" nmap <silent> <leader>gr <Plug>(coc-references)
" nmap <silent> gk <Plug>(coc-codeaction)

xmap <silent> <leader>gk <Plug>(coc-codeaction-selected)
nmap <silent> <leader>gk <Plug>(coc-codeaction-selected)

nmap <silent> <leader>gf call CocAction('runCommand', 'editor.action.formatDocument')

" xmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)

" Cursors
nmap <silent> <leader>c <Plug>(coc-cursors-position)
nmap <C-c> <Plug>(coc-cursors-operator)
xmap <silent> <C-c> <Plug>(coc-cursors-range)

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>re  <Plug>(coc-codeaction-refactor)

nmap <silent> <leader>ga :call php#laravel#goto_attribute()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        :lua vim.lsp.buf.hover()
    endif
endfunction

nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

augroup phpHold
autocmd!
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold *.php silent call <SID>show_documentation()
" autocmd CursorHold *.vue silent call <SID>show_documentation()
" autocmd CursorHold *.js silent call <SID>show_documentation()
autocmd CursorHold *.php silent call CocActionAsync('highlight')
autocmd CursorHold *.blade.php silent call CocActionAsync('highlight')
autocmd CursorHold *.vue silent call CocActionAsync('highlight')
autocmd CursorHold *.js silent call CocActionAsync('highlight')
augroup END

" Map function and class text objects (operator mappings for inner-function,
" a-function, etc.)
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" eslint
command! EslintQuiet call coc#config('eslint.quiet', coc#util#get_config('eslint')['quiet'] ? v:false : v:true)
" ---- }}}

nnoremap <silent> <leader>gl :Lines<CR>

" autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

" NVIM DAP (config in lua) and DAP UI
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" --- Editor Config --- {{{

" ----- Tagbar ----- {{{
Plug 'majutsushi/tagbar'

let s:hidden_all = 1

function! s:tagbar_autopause()
    let l:open = 0
    let tagbarwinnr = -1

    try
        let tagbarwinnr = bufwinnr(t:tagbar_buf_name)
    catch /^Vim(\a\+):E121:/
        :TagbarOpen
        :TagbarTogglePause
        return
    endtry

    if tagbarwinnr != -1
        let l:open = 1
    endif

    if l:open && winnr() == tagbarwinnr
        :TagbarClose
    elseif l:open && winnr() != tagbarwinnr
        :TagbarOpen fj
    elseif !l:open
        :TagbarOpen
    endif
endfunction

command! -bar TagbarFrozen call s:tagbar_autopause()
nnoremap <silent> <C-s> :TagbarFrozen<cr>
vnoremap <silent> <C-s> <esc>:TagbarOpen fj<cr> :TagbarCurrentTag<cr>
" ----- }}}

" Close all buffers except open one
Plug 'vim-scripts/BufOnly.vim'

" Tmux-style Pane Zooming
Plug 'dhruvasagar/vim-zoom'
nnoremap <leader>+ :<C-u>call zoom#toggle()<cr>

" delimiter assistance
Plug 'Raimondi/delimitMate'

" Git wrapper for vim
Plug 'tpope/vim-fugitive'
nnoremap <silent><C-B> :Git blame<cr>

" GV - git log browser
Plug 'junegunn/gv.vim'

" Managing quotations, surrounding brackets, etc. Made easier
Plug 'tpope/vim-surround'

" The missing motion - sneak
Plug 'justinmk/vim-sneak'

" Should keep me in root dir for commands like fzf
Plug 'airblade/vim-rooter'

" ---- FZF Plugins for Fuzzy File Finding ---- {{{
if executable('fzf')
    nnoremap <silent> <C-p> :FzfLua files<cr>
    nnoremap <silent> <M-p> :FzfLua buffers<CR>
    nnoremap <silent> <leader>gl :FzfLua lines<CR>

    " nmap <silent> <leader>gd :FzfLua lsp_definitions<CR>
    nmap <silent> <leader>gd :lua vim.lsp.buf.definition()<CR>
    nmap <silent> <leader>gr :FzfLua lsp_references<CR>
    nmap <silent> <leader>gk :FzfLua lsp_code_actions<CR>

    nmap <silent> <leader>f :FzfLua<CR>
    nmap <silent> <leader>rn :lua vim.lsp.buf.rename()<CR>

    command! -nargs=* -bang Rg :FzfLua grep_project

    function! s:git_changed(...)
        let l:source = (a:0 > 0 ? 'git diff --name-only ' . join(a:000) : 'git diff --name-only --diff-filter=d')
        call fzf#run({
            \   'source': l:source,
            \   'options': '--multi -i',
            \   'sink': 'e',
            \   'down': '40%'
            \   })
    endfunction

    command! -nargs=* GitChanged call s:git_changed(<f-args>)
end
" }}}

" ---- Ack for Vim ---- {{{
Plug 'mileszs/ack.vim', {'on': ['Ack', 'Ack!']}
cnoreabbrev Ack Ack!

" Finding Keybinds for Ack
nnoremap <leader><C-f> :Ack!<Space>
vnoremap <leader><C-f> y :Ack!<Space><C-r>"
nnoremap <C-f> /
vnoremap <C-f> y /<C-r>"
" ---- }}}

" ---- Emmet ---- {{{
Plug 'mattn/emmet-vim', {'for': ['html', 'vue']}

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

" ---- Testing ---- {{{
Plug 'vim-test/vim-test', {'for': 'php'}

function! s:goto_test()
    let l:root = "application/"
    let l:test_root = "tests/unit/"
    let l:filename = expand('%')
    let l:result = substitute(l:filename, l:root, l:test_root, '')
    let l:result = substitute(l:result, '.php', 'Test.php', '')

    if !filereadable(l:result)
        echoe "No test file found: " . l:result
        return
    endif

    execute 'edit ' . l:result
endfunction

command! GotoTest call s:goto_test(<f-args>)
nnoremap <silent><leader>gt :GotoTest<cr>

Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'

Plug 'afternoon/vim-phpunit'

" ----- Default phpunit settings ----- {{{
"  See vim-test/autoload/test/strategy.vim +222
function! s:execute_with_compiler(cmd, script) abort
  try
    let default_makeprg = &l:makeprg
    let default_errorformat = &l:errorformat
    let default_compiler = get(b:, 'current_compiler', '')

    if exists(':Dispatch')
      let compiler = dispatch#compiler_for_program(a:cmd)
      if !empty(compiler)
        execute 'compiler ' . compiler
      endif
    endif

    let &l:makeprg = a:cmd

    execute a:script
  finally
    let &l:makeprg = default_makeprg
    let &l:errorformat = default_errorformat
    if empty(default_compiler)
      unlet! b:current_compiler
    else
      let b:current_compiler = default_compiler
    endif
  endtry
endfunction

function! Mapqfitems(key, val)
    let l:result = copy(a:val)
    let l:result['filename'] = substitute(bufname(a:val['bufnr']), '/var/www/jbx/', '', 'g')
    unlet l:result['bufnr']
    return l:result
endfunction

function! FinishTestAsyncRun()
    if (g:asyncrun_code)
        echo "Failure"
        return
    endif

    let l:errors = getqflist()
    if (len(l:errors))
        copen
        call setqflist([], 'r', {
            \ 'title': 'Test Result',
            \ 'items': map(l:errors, function('Mapqfitems'))
        \ })
    else
        echom 'All tests passed!'
    endif
endfunction

function! AsyncrunBackgroundUpdatedStrategy(cmd)
  echom 'Running tests...'
  let g:test#strategy#cmd = a:cmd
  call test#strategy#asyncrun_setup_unlet_global_autocmd()
  call s:execute_with_compiler(a:cmd, 'AsyncRun -strip -mode=async -silent -post=call\ FinishTestAsyncRun()'.' '.a:cmd)
endfunction

let g:test#custom_strategies = {'asyncrun_bg_updated': function('AsyncrunBackgroundUpdatedStrategy')}
" let g:test#strategy = 'asyncrun_bg_updated'
let g:test#strategy = 'neovim'
let test#neovim#term_position = "vert botright"
let g:dispatch_compilers = {}
  " \ 'nearest': '-d memory_limit=2G --colors=never --xdebug',
let test#php#phpunit#options = {
  \ 'nearest': '-d memory_limit=2G --colors=always --testdox --xdebug',
  \ 'file':    '-d memory_limit=2G --colors=always --testdox --xdebug',
  \ 'suite':   '-d memory_limit=2G --testdox',
\}

let test#php#phpunit#executable = "./vendor/bin/phpunit"
" ----- }}}

nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>t. :TestLast<CR>
nnoremap <silent> <leader>td :TestVisit<CR>
" ---- }}}

" ---- Markdown ---- {{{
" Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': function('mkdp#util#install')}
" Fork with latest version of mermaid
Plug 'sherocktong/markdown-preview.nvim', {'for': 'markdown', 'do': function('mkdp#util#install')}
let g:mkdp_markdown_css = '~/Code/.files/nvim/dependencies/markdown/custom.css'
" '<,'>s/- \zs\(.*\)\ze$/\="["..submatch(0).."](#"..substitute(tolower(submatch(0)), ' ', '-', 'g')..")""
" '<,'>s/^[ ]*/\=repeat('#', strlen(submatch(0)))/g
" ---- }}}

" ---- Documentation stubs ---- {{{
Plug 'tobyS/vmustache'
" Fork of 'tobyS/pdv' with return types
Plug 'YaroslavMolchan/pdv'
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

" Disable tabline and don't use GUI tabline; we have lightline / buftabline
set showtabline=0 " 2 to show
set guioptions-=e  " Don't use GUI tabline

" ---- Lightline for Vim ---- {{{

Plug 'itchyny/lightline.vim'

function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

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
      \     [ 'cocstatus', 'cocfunction', 'fileformat', 'fileencoding', 'filetype' ]
      \   ]
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
      \   'cocstatus': 'StatusDiagnostic',
      \   'cocfunction': 'CocCurrentFunction',
      \ },
      \ 'component_type': {
      \ },
      \ }

let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

let g:lightline.tabline = {
  \   'left': [],
  \   'right': []
  \ }


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

" Work Config
if filereadable($HOME . '/jbx.vim')
    source $HOME/jbx.vim
endif

" ===========================================================================

call plug#end()

" lua scripts
lua require('xp-bar')

nmap <silent> <leader>i :Inspect<cr>
nmap <silent> <leader>I :InspectTree<cr>
nnoremap <leader>IH :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldtext=nvim_treesitter#foldtext()
set nofoldenable
