set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim

if has('linux') && (substitute(system('which brew'), "\n", "", "") != "")
    set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf " fzf unix
else
    set rtp+=/usr/local/opt/fzf " fzf mac
endif

call vundle#begin()

" ===========================================================================
" ===========================================================================
"
"               ▌ ▌        ▛▀▖      ▝▌            ▗
"               ▝▞ ▛▀▖     ▙▄▘▝▀▖▙▀▖▝▞▀▘       ▌ ▌▄ ▛▚▀▖▙▀▖▞▀▖
"               ▞▝▖▙▄▘     ▌ ▌▞▀▌▌   ▝▀▖     ▗▖▐▐ ▐ ▌▐ ▌▌  ▌ ▖
"               ▘ ▘▌   ▀▀▀ ▀▀ ▝▀▘▘   ▀▀      ▝▘ ▘ ▀▘▘▝ ▘▘  ▝▀
"
" ===========================================================================
" ===========================================================================
"       This is my personal .vimrc, built with neovim in mind. Enjoy! 

" Vundle Plugin Manager manages itself, like npm
Plugin 'VundleVim/Vundle.vim'

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

" ----- Buffers ----- {{{
" Nicer buffer closing
Plugin 'moll/vim-bbye'
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
Plugin 'christoomey/vim-tmux-navigator'
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

" ----- Hidden command ----- {{{
function! s:hidden(...)
    let l:listchars = ''
    if a:0 == 0
        let l:listchars='tab:>\ ,space:·,nbsp:␣,trail:-,eol:$'
    else
        for i in a:000
            if i == 'tab'
                let l:listchars = l:listchars . 'tab:>\ ,'
            elseif i == 'space'
                let l:listchars = l:listchars . 'space:·,'
            elseif i == 'nbsp'
                let l:listchars = l:listchars . 'nbsp:␣,'
            elseif i == 'trail'
                let l:listchars = l:listchars . 'trail:-,'
            elseif i == 'eol'
                let l:listchars = l:listchars . 'eol:$,'
            endif
        endfor
    endif

    let &listchars = substitute(l:listchars, ',$', '', '')

    if &list == 'nolist'
        set list
    else
        set nolist
    endif
endfunction

command! -nargs=* Hidden call s:hidden(<f-args>)
" ----- }}}
" ---- }}}
" --- }}}

" --- User Interface --- {{{

" ---- Startup Screen ---- {{{
Plugin 'mhinz/vim-startify'
" Startify config
let g:startify_bookmarks = [
        \ {'~' : '~/'},
        \ {'.a' : '~/.alias'},
        \ {'.f' : '~/.function'},
        \ {'.v' : '~/.config/nvim/init.vim'},
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
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" -- }}}

" -- Visual marks -- {{{
Plugin 'kshenoy/vim-signature'
"  }}}

" ---- Sidebar NERDTree ---- {{{
Plugin 'scrooloose/nerdtree'
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
Plugin 'Xuyuanp/nerdtree-git-plugin'

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
Plugin 'airblade/vim-gitgutter'

let g:gitgutter_highlight_linenrs = 1

function! s:do_review(branch)
    let l:base_sha = substitute(system('git rev-parse ' . a:branch), '[^A-z0-9]', '', 'g')
    let g:gitgutter_diff_base = l:base_sha

    :GitGutterLineHighlightsEnable

    set foldmethod=manual
    set foldlevel=2

    let l:files = systemlist('git diff --name-only ' . a:branch)

    for file in l:files
        exec 'e ' . file
    endfor

    " sleep 500m

    " bufdo GitGutterFold
endfunction

command! -nargs=1 Review call s:do_review(<f-args>)
" --- }}}

" --- Buftabline --- {{{
Plugin 'ap/vim-buftabline'

" Only show if there are 2+ buffers open (0 = never, 1 = if buffers > 2, 2 = always)
let g:buftabline_show = 1

" Numbers beside buffers (0 = none, 1 = internal buffer number, 2 = ordinal)
let g:buftabline_number = 1

let g:buftabline_indicators = 1

" -- Keymap -- {{{
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)
" -- }}}

" --- }}}

" --- Goyo --- {{{
Plugin 'junegunn/goyo.vim'
let g:goyo_width = 120
nnoremap <silent><leader>y :Goyo \| call buftabline#update(0)<cr>
" --- }}}

" }}}

" --- Syntax --- {{{

" html5 omnicomplete
Plugin 'othree/html5.vim'

" Handlebars
Plugin 'mustache/vim-mustache-handlebars'

augroup handlebars
    autocmd BufNewFile,BufRead *.html set filetype=html.handlebars
augroup END

Plugin 'jyyan/vim-volt-syntax'
augroup volt
    autocmd BufNewFile,BufRead *.volt set filetype=volt
augroup END


Plugin 'xwsoul/vim-zephir'
augroup zephir
    autocmd BufNewFile,BufRead *.zep set filetype=zephir
augroup END


" Scss support
Plugin 'cakebaker/scss-syntax.vim'

" Better PHP Lang Support
Plugin 'StanAngeloff/php.vim' 
augroup php
autocmd!
autocmd BufNewFile,BufRead *.php setlocal foldlevel=1000
augroup END

" Javascript
Plugin 'pangloss/vim-javascript'

inoreabbrev clog console.log();<Left><Left>
inoreabbrev cgroup console.group();<cr><cr>console.log();<cr><cr>console.groupEnd();

" --- Prettier --- {{{
Plugin 'prettier/vim-prettier'
" --- }}}

" JS Doc
Plugin 'heavenshell/vim-jsdoc'
let g:jsdoc_allow_input_prompt=0
let g:jsdoc_enable_es6=1
let g:jsdoc_input_description=1
let g:jsdoc_return_description=0

" -- Documentation -- {{{
" See - tobyS/pdv
" See - heavenshell/vim-jsdoc
augroup documentors
    autocmd!
    autocmd FileType php nnoremap <silent> <leader>d :call pdv#DocumentCurrentLine()<cr> 
    autocmd FileType vue nmap <silent> <leader>d <Plug>(jsdoc)
    autocmd FileType javascript nmap <silent> <leader>d <Plug>(jsdoc)
augroup END
"  }}}

" Typescript and Vue
Plugin 'posva/vim-vue'
" let g:vue_disable_pre_processors=1
let g:vue_pre_processors = ['typescript', 'scss']

command! WebpackImport call vue#snippets#webpack_async_import()
command! Vue call vue#snippets#vue_files()
command! Mutator call vue#snippets#set_mutator()
command! Getter call vue#snippets#get_getter()

augroup syntaxcommands
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType sass setlocal omnifunc=csscomplete#CompleteCSS
    autocmd BufEnter,BufRead,BufNewFile *.vue set filetype=vue
    autocmd FileType vue syntax sync fromstart
    autocmd FileType vue setlocal makeprg=eslint\ --format=unix\ $*\ %
    autocmd FileType javascript setlocal makeprg=eslint\ --format=unix\ $*\ %
augroup END

augroup vueabbrevs
    autocmd!
    autocmd FileType vue inoreabbrev gscomp : {<CR><Tab>get() {<CR><CR>},<CR>set() {<CR><CR>}<CR>}, <Esc><<F%s<c-o>:call getchar()<CR>
augroup END

" Laravel
Plugin 'jwalton512/vim-blade'
" Workaround to ensure correct filetypes for blade template syntax highlight
augroup blade
autocmd!
autocmd BufNewFile,BufRead *.blade.php setlocal filetype=blade
augroup END

command! -nargs=* -complete=customlist,php#laravel#blade_list Blade call php#laravel#blade_files(<f-args>)

Plugin 'leafgarland/typescript-vim'

augroup typescript
autocmd!
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
augroup END


Plugin 'stephpy/vim-php-cs-fixer'

let g:phpcs_fix = v:true
let g:php_cs_fixer_config = "$HOME/.php-cs-fixer.php"

function! s:phpcs_fix()
    if (g:phpcs_fix)
        call PhpCsFixerFixFile()
    fi
endfunction

autocmd BufWritePost *.php silent! call s:phpcs_fix()

" ---- Conquer of Completion {{{
Plugin 'neoclide/coc.nvim'

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> gk <Plug>(coc-codeaction)

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
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>re  <Plug>(coc-codeaction-refactor)

nmap <silent> <leader>ga :call php#laravel#goto_attribute()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction

nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

augroup phpHold
autocmd!
" Highlight symbol under cursor on CursorHold
autocmd CursorHold *.php silent call CocActionAsync('highlight')
autocmd CursorHold *.blade.php silent call CocActionAsync('highlight')
autocmd CursorHold *.vue silent call CocActionAsync('highlight')
autocmd CursorHold *.js silent call CocActionAsync('highlight')
augroup END

" Map function and class text objects (operator mappings for inner-function,
" a-function, etc.)
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" eslint
command! EslintQuiet call coc#config('eslint.quiet', coc#util#get_config('eslint')['quiet'] ? v:false : v:true)
" Installation: 
" run coc#util#install()
" run :CocInstall coc-phpls
" ---- }}}

nnoremap <silent> <leader>gl :Lines<CR>

" autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

let g:swift_plugin_directory = $HOME . '/swift/apple/swift'

if isdirectory(g:swift_plugin_directory)
    Plugin 'file://' . g:swift_plugin_directory,
                \ {'rtp': 'utils/vim/','name': 'Swift-Syntax'}
endif

autocmd BufNewFile,BufRead *.swift set syntax=swift | set filetype=swift

" xdebug for vim
Plugin 'vim-vdebug/vdebug'
let g:vdebug_options = {
        \ 'port' : 9003,
        \ 'timeout' : 20,
        \ 'server' : 10.0.2.2,
        \ 'on_close' : 'stop',
        \ 'break_on_open' : 0,
        \ 'ide_key' : 'PHPSTORM',
        \ 'debug_window_level' : 0,
        \ 'debug_file_level' : 0,
        \ 'debug_file' : '',
        \ 'path_maps' : {},
        \ 'watch_window_style' : 'expanded',
        \ 'marker_default' : '⬦',
        \ 'marker_closed_tree' : '▸',
        \ 'marker_open_tree' : '▾',
        \ 'sign_breakpoint' : '▷',
        \ 'sign_current' : '▶',
        \ 'continuous_mode'  : 1,
        \ 'simplified_status': 1,
        \ 'layout': 'horizontal',
        \ }

let g:vdebug_keymap = {
    \ "run" : "<Leader>xr",
    \ "run_to_cursor" : "<Leader>xc",
    \ "step_over" : "<Leader>xo",
    \ "step_into" : "<Leader>xi",
    \ "step_out" : "<Leader>xu",
    \ "close" : "<Leader>xs",
    \ "detach" : "<Leader>xd",
    \ "set_breakpoint" : "<Leader>xb",
    \ "get_context" : "<F11>",
    \ "eval_under_cursor" : "<Leader>xc",
    \ "eval_visual" : "<Leader>e",
    \ }

nnoremap <silent> <M-b> :Breakpoint<cr>
nnoremap <silent> <M-r> :BreakpointRemove *<cr>

" Database Markdown Language Syntax
Plugin 'jidn/vim-dbml'

augroup dbml
autocmd!
autocmd BufNewFile,BufRead *.dbml set syntax=dbml
augroup END
" }}}

" --- Editor Config --- {{{

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
Plugin 'junegunn/vim-easy-align'

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

" ----- Tagbar ----- {{{
Plugin 'majutsushi/tagbar'

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

" ---- Unjoin lines ---- {{{
" https://vim.fandom.com/wiki/Add_a_newline_after_given_patterns
function! LineBreakAt(bang, ...) range
    let save_search = @/

    if empty(a:bang)
        let before = ''
        let after = '\ze.'
        let repl = '&\r'
    else
        let before = '.\zs'
        let after = ''
        let repl = '\r&'
    endif
    " let l:pat_list = map(deepcopy(a:000), "escape(v:val, '/\\.*$^~[')")
    let l:pat_list = map(deepcopy(a:000), "escape(v:val, '/\\.*$^~')")
    let l:find = empty(l:pat_list) ? @/ : join(l:pat_list, '\|')
    let l:find = before . '\%(' . l:find . '\)' . after
    " Example: 10,20s/\%(arg1\|arg2\|arg3\)\ze./&\r/ge
    execute a:firstline . ',' . a:lastline . 's/'. l:find . '/' . repl . '/ge'

    " reindent the lines
    mark q
    normal gvg`q=jk
    delmarks q

    let @/ = save_search
endfunction

command! -bang -nargs=* -range Unjoin <line1>,<line2>call LineBreakAt('<bang>', <f-args>)
" ---- }}}

" Close all buffers except open one
Plugin 'vim-scripts/BufOnly.vim'

" Tmux-style Pane Zooming
Plugin 'dhruvasagar/vim-zoom'
nnoremap <leader>+ :<C-u>call zoom#toggle()<cr>

" delimiter assistance
Plugin 'Raimondi/delimitMate'

" Git wrapper for vim
Plugin 'tpope/vim-fugitive'
nnoremap <silent><C-B> :Git blame<cr>

" GV - git log browser
Plugin 'junegunn/gv.vim'

augroup gitgroup
    autocmd!
    autocmd FileType diff setlocal foldlevel=1000
    autocmd FileType gitcommit inoreabbrev co- <ESC>:GitCoAuth<CR>
augroup END

" Managing quotations, surrounding brackets, etc. Made easier
Plugin 'tpope/vim-surround'

" The missing motion - sneak
Plugin 'justinmk/vim-sneak'

" Should keep me in root dir for commands like fzf
Plugin 'airblade/vim-rooter'

" ---- FZF Plugins for Fuzzy File Finding ---- {{{
if executable('fzf')
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'

    Plugin 'jesseleite/vim-agriculture'

    function! RipgrepFzf(query, fullscreen)
        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

    command! -nargs=* -bang Rg call fzf#vim#grep(
                \"rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>),
                \1,
                \fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}),
                \<bang>0)
    
    command! -bang -nargs=? -complete=dir PFiles call fzf#vim#files(
        \   <q-args>,
        \   fzf#vim#with_preview(
        \       {
        \           'options': [
        \               '--multi',
        \               '-i',
        \               '--preview', 'bat --theme=TwoDark --color=always {}',
        \           ],
        \          'window': { 'width': 0.9, 'height': 0.6 }
        \       }
        \   ),
        \   <bang>0
        \)

    function! s:all_files(query, fullscreen)
        let spec = {
        \   'source': 'rg --files --smart-case --no-ignore',
        \   'sink': 'e',
        \   'options': [
        \        '--multi',
        \        '-i',
        \        '--preview', 'bat --theme=TwoDark --color=always {}',
        \    ],
        \   'window': { 'width': 0.9, 'height': 0.6 }
        \}

        call fzf#run(fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang AllFiles call s:all_files(<q-args>, <bang>0)

    nnoremap <silent> <C-p> :PFiles<cr>
    nnoremap <silent> <C-S-P> :AllFiles<cr>
    nnoremap <silent> <M-p> :Buffers<cr>
    nnoremap <silent> <M-S-p> :History<cr>
  
    let g:fzf_nvim_statusline = 0

    function! s:build_quickfix_list(lines)
        call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
        copen
        cc
    endfunction

    let g:fzf_action = {
          \ 'ctrl-q': function('s:build_quickfix_list'),
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit'
          \ }

    function! s:git_changed(...)
        let l:source = (a:0 > 0 ? 'git diff --name-only ' . join(a:000) : 'git diff --name-only --diff-filter=d')
        call fzf#run({
            \   'source': l:source,
            \   'options': '--multi -i',
            \   'sink': 'e',
            \   'down': '40%'
            \   })
    endfunction

    command! AVendor FZF application/vendor/
    command! Vendor FZF vendor/
    command! Modules FZF node_modules/
    command! -nargs=* GitChanged call s:git_changed(<f-args>)
end
" }}}

" ---- Quickfix ---- {{{
function! s:RemoveQFItem()
    let curqfidx = line('.') - 1
    let qfall = getqflist()
    call remove(qfall, curqfidx)
    call setqflist(qfall, 'r')
    :copen
endfunction

function! s:AddQFItem(...)
    let l:text = (a:0 > 0 ? join(a:000) : getline('.'))
    call setqflist(getqflist(), 'a', {
    \    'title': 'My List',
    \    'nr': 0,
    \    'items': [
    \       {
    \           'filename': expand('%'),
    \           'lnum': line('.'),
    \           'text': l:text
    \       }
    \      ]
    \   }
    \   )
    botright copen
endfunction

command! QfRemove :call s:RemoveQFItem()
command! -nargs=* Qf :call s:AddQFItem(<f-args>)
autocmd FileType qf map <buffer> dd :QfRemove<cr>
nmap <silent> <leader>aq :Qf<cr>
" ---- }}}

" ---- Ack for Vim ---- {{{
Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!

" Finding Keybinds for Ack
nnoremap <leader><C-f> :Ack!<Space>
vnoremap <leader><C-f> y :Ack!<Space><C-r>"
nnoremap <C-f> /
vnoremap <C-f> y /<C-r>"
" ---- }}}

" ---- Emmet ---- {{{
Plugin 'mattn/emmet-vim'

let g:user_emmet_leader_key='<leader>' 
let g:user_emmet_mode='n'

inoremap <C-Return> <cr><cr><C-o>k<Tab>
" ---- }}}

" ---- Comment and Un-comment lines on the fly ---- {{{
Plugin 'tpope/vim-commentary'
" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
" Vim recognizes C-_ as C-/, so control+/ will toggle comments
noremap <C-_> :Commentary<cr>
" ---- }}}

" ---- Make command ---- {{{
function! s:make_func(...)
    silent exec 'make ' . (a:0 > 0 ? a:1 : '')
    bot copen
endfunction
command! -nargs=* Make call s:make_func(<f-args>)
cnoreabbrev make Make
" ---- }}}

Plugin 'simnalamburt/vim-mundo'
" --- }}}

" --- Language Config --- {{{
" ---- Add a namespace declaration - php ---- {{{
augroup phpNamespace
    autocmd!
    command! -nargs=* Class call php#php#new_class(<f-args>)
augroup END
" ---- }}}

" ---- PHP Folding options ---- {{{ 
" convert '@return ReturnType' to ': ReturnType' in function preview if there is no return type specified in the function declaration
let g:php_fold_return_comment_as_declaration=1

" convert function access (public, private, protected) to UPPERCASE in preview
let g:php_fold_uppercase_access_types=0

" if the return type can't be found from an @return tag or a return type declaration, show the return type as ': unknown type' 
let g:php_fold_show_unknown_types=1

" the maximum length for function comments (accross all lines) before being truncated with '...'
let g:php_fold_comment_length=60

" show a preview of the first line in the fold, otherwise show the number of hidden lines
let g:php_fold_show_fold_preview=0
" --- }}}

" ---- PHP Namespace and Use Statement support in Vim ---- {{{
Plugin 'arnaud-lb/vim-php-namespace'

let g:php_namespace_sort_after_insert=1

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

augroup phpImports
    autocmd!
    let errorformat =
            \ '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity%.%#,'.
            \ '"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-]\,%*[0-9]%.%#'
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
    autocmd FileType php setlocal commentstring=//%s
    autocmd FileType php setlocal makeprg=phpcs\ $*\ --report=csv\ --standard=XpBar\ -n\ %
    autocmd FileType php let &errorformat=errorformat
    " autocmd FileType php inoreabbrev fn function () {<CR>}<Esc>F%s<c-o>:call getchar()<CR>
augroup END
" ---- }}}

" --- Additional PHP functions --- {{{
function! s:tinker()
    silent execute '!echo "<?php\\n" > $TMPDIR/tinker'
    silent tabnew $TMPDIR/tinker
    silent setlocal filetype=php
    silent setlocal makeprg=php\ artisan\ tinker\ %

    function! s:make_func(...)
        silent exec 'make ' . (a:0 > 0 ? a:1 : '')
        vert copen 100
    endfunction
    command! -nargs=* Make call s:make_func(<f-args>)
endfunction

command! Tinker call s:tinker()
" --- }}}

" ---- Testing ---- {{{
Plugin 'vim-test/vim-test'

" ----- Default phpunit settings ----- {{{
let test#strategy = "neovim"
let test#neovim#term_position = "vert botright"
let test#php#phpunit#options = {
  \ 'nearest': '-d memory_limit=2G --testdox',
  \ 'file':    '-d memory_limit=2G --testdox',
  \ 'suite':   '-d memory_limit=2G',
\}

if filereadable($HOME . '/Code/.files-jumbleberry/phpunit.vim')
    source $HOME/Code/.files-jumbleberry/phpunit.vim
else
    let test#php#phpunit#executable = "./vendor/bin/phpunit"
endif
" ----- }}}

nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>t. :TestLast<CR>
nnoremap <silent> <leader>td :TestVisit<CR>
" ---- }}}

" ---- Markdown ---- {{{
Plugin 'iamcco/markdown-preview.nvim'

" Installation:
" call mkdp#util#install()
" ---- }}}

" ---- Documentation ---- {{{
" ----- phpDocumentor ----- {{{
Plugin 'tobyS/vmustache'
" Plugin 'tobyS/pdv'
" Fork with return types
Plugin 'YaroslavMolchan/pdv'
let g:pdv_template_dir=expand($HOME) . "/.pdv-templates"
" ----- }}}
" ---- }}}
" --- }}}

" --- Themimg --- {{{

" ---- Lightline for Vim ---- {{{

Plugin 'itchyny/lightline.vim'

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

set showtabline=0 " 2 to show

set guioptions-=e  " Don't use GUI tabline


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

if (has("termguicolors"))
    set termguicolors
else
    set notermguicolors
endif

set background=dark " for the dark version
colorscheme two

syntax on

nnoremap <silent> <C-[> :syn sync fromstart<cr>
command! BufSync :execute 'bufdo :e' | source $VIMRUNTIME/syntax/syntax.vim

" }}}

" --- Fun Stuff --- {{{
nnoremap <leader>[ :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" command! -bang Qa :echom "QUACK!"
" command! Qa1 :echom "QUACK!"
cnoreabbrev Qa qa
cnoreabbrev QA qa


function! s:starts_with(longer, shorter) abort
  if len(a:shorter) == 0
      return v:true
  endif

  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

function! s:spotify_cmd(ArgLead, CmdLine, CursorPos)
    if a:CmdLine =~ 'play'
        return filter([
            \ 'album',
            \ 'artist',
            \ 'list',
            \ 'uri'
        \ ], 's:starts_with(v:val, a:ArgLead)')
    endif

    if a:CmdLine =~ 'vol'
        return filter([
            \ 'up',
            \ 'down',
            \ 'show'
        \ ], 's:starts_with(v:val, a:ArgLead)')
    endif

    if a:CmdLine =~ 'toggle'
        return filter([
            \ 'shuffle',
            \ 'repeat'
        \ ], 's:starts_with(v:val, a:ArgLead)')
    endif

    return filter([
        \ 'play',
        \ 'pause',
        \ 'next',
        \ 'prev',
        \ 'replay',
        \ 'pos',
        \ 'stop',
        \ 'quit',
        \ 'vol',
        \ 'toggle'
    \ ], 's:starts_with(v:val, a:ArgLead)')
endfunction

function! s:spotify(...)
    if a:0 == 0
        let l:status = [
            \ systemlist('spotify status track')[0],
            \ ' - ',
            \ systemlist('spotify status artist')[0]
        \ ]

        echom join(l:status, ' ')
    else
        let l:cmd = 'spotify ' . substitute(shellescape(join(a:000, ' ')), "'", '', 'g')
        let l:result = systemlist(l:cmd)
        echom substitute(join(l:result, ' '), '\e\[[0-9;]*[mK]*', '', 'g')
    endif

endfunction

command! -nargs=* -complete=customlist,s:spotify_cmd Spotify call s:spotify(<f-args>)
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
"  }}}

" ===========================================================================

call vundle#end()            " required
filetype plugin indent on    " required
