set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
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
set shiftwidth=4  " operation >> indents 2 columns; << unindents 2 columns
set tabstop=4     " a hard TAB displays as 2 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
" set smartindent
set conceallevel=0
" set ignorecase
set smartcase
set mousefocus
set mouse=a
set hidden
" set shell=/usr/local/bin/zsh\ -i
set shell=zsh
set tagcase=smart

set complete+=t

" OSX stupid backspace fix
set backspace=indent,eol,start


" --- PHP Folding options --- {{{ 
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


" Autoread files to watch for changes outside of vim
set autoread
augroup autoreload
    autocmd!
    " Thanks, Stack Overflow: https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END

set foldmethod=marker
set foldlevel=0
set nowrap
autocmd filetype crontab setlocal nobackup nowritebackup
" --- }}}

" --- General Settings --- {{{

map <Space> <leader>

" Clear highlight after search
nnoremap <silent><cr> :noh<CR><CR>:<backspace>

" Quick Open vimrc while vim is open
nnoremap <silent><leader>ev :vsplit $MYVIMRC<cr>

" Quick Open vimrc while vim is open
nnoremap <silent><leader>en :split $MYVIMRC<cr>

nnoremap <leader>w :w<cr>

vnoremap <leader>s :sort<cr>

" -- Nicer buffer closing -- {{{
Plugin 'moll/vim-bbye'
nnoremap <leader>q :Bdelete<cr>
" -- }}}

" Splits
" {{{
nnoremap <leader>v :vsp<cr>
nnoremap <leader>n :sp<cr>
vnoremap <leader>v :vsp<cr>
vnoremap <leader>n :sp<cr>

nnoremap <leader>\| :vsp<cr>
nnoremap <leader>_ :sp<cr>
vnoremap <leader>\| :vsp<cr>
vnoremap <leader>_ :sp<cr>
nnoremap <leader>x :q<cr>
vnoremap <leader>x :q<cr>
" }}}

" Auto Commands
" {{{
augroup buffercmds 
    autocmd!
    " Auto allow folds in vimrc file
    autocmd BufNewFile,BufRead .vimrc :setlocal foldlevelstart=0
    
    " Indent HTML files on save
    autocmd BufWritePre *.html :normal gg=G
    
    " No linewrap html
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    
    " Spellcheck Markdown 
    autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us
    
    " No linewrap html
    autocmd BufNewFile,BufRead *.php setlocal nowrap
augroup END
" }}}


" change between parens
onoremap in( :<c-u>normal! f(vi(<cr>

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


" Act like a typewriter
" {{{
nnoremap <leader>t :call TypeWriterToggle()<cr>

function! TypeWriterToggle()
    if &scrolloff ==# "0"
        :set scrolloff=99
        :set sidescrolloff=99
    else
        :set scrolloff=0
        :set sidescrolloff=0
    endif
endfunction
" }}}

" Navigate Tmux and Vim Seamlessly
" {{{
Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" }}}

" halve the wait time for multi-key keybinds
set ttm=25

" }}}

" --- User Interface --- {{{

" ---- Startup Screen ---- {{{
Plugin 'mhinz/vim-startify'
" Startify config
let g:startify_bookmarks = [
        \ {'i' : '~/swift/roomroster'},
        \ {'r' : '~/Sites/RoomRoster'},
        \ {'~' : '~/'},
        \ {'a' : '~/.alias'},
        \ {'f' : '~/.function'},
        \ {'v' : '~/.vimrc'},
        \ {'t' : '~/.tmux.conf'},
        \ {'z' : '~/.zshrc'},
        \ {'p' : '~/.zsh-plugins'},
        \ ]

let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   Most Recently Used in '. getcwd()] },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ ]
let g:startify_custom_header = [
        \ '',
        \ '',
        \ '                                             ▀▀ ',
        \ '      ██▄████▄   ▄████▄    ▄████▄   ██▄  ▄██   ████     ████▄██▄ ',
        \ '      ██▀   ██  ██▄▄▄▄██  ██▀  ▀██   ██  ██      ██     ██ ██ ██ ',
        \ '      ██    ██  ██▀▀▀▀▀▀  ██    ██   ▀█▄▄█▀      ██     ██ ██ ██ ',
        \ '      ██    ██  ▀██▄▄▄▄█  ▀██▄▄██▀    ████    ▄▄▄██▄▄▄  ██ ██ ██ ',
        \ '      ▀▀    ▀▀    ▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀▀▀▀▀▀▀  ▀▀ ▀▀ ▀▀ ',
        \ ''  ,
        \ '  ▜ ▗▐           ▜▜     ▐  ▌      ▗▀▖   ▐               ▗▀▖    ▗ ',
        \ '  ▐ ▄▜▀ ▞▀▖▙▀▖▝▀▖▐▐ ▌ ▌ ▜▀ ▛▀▖▞▀▖ ▐  ▌ ▌▜▀ ▌ ▌▙▀▖▞▀▖ ▞▀▖▐   ▌ ▌▄ ▛▚▀▖ ',
        \ '  ▐ ▐▐ ▖▛▀ ▌  ▞▀▌▐▐ ▚▄▌ ▐ ▖▌ ▌▛▀  ▜▀ ▌ ▌▐ ▖▌ ▌▌  ▛▀  ▌ ▌▜▀  ▐▐ ▐ ▌▐ ▌ ',
        \ '   ▘▀▘▀ ▝▀▘▘  ▝▀▘ ▘▘▗▄▘  ▀ ▘ ▘▝▀▘ ▐  ▝▀▘ ▀ ▝▀▘▘  ▝▀▘ ▝▀ ▐    ▘ ▀▘▘▝ ▘ ',
        \ '',
        \]

" let g:startify_custom_header = 
            " \ map(split(system('fortune -s -n $[$(tput cols)/2] | toilet -f "Stick Letters" -w 200'), '\n'), '"   ". v:val')
" let g:startify_custom_footer = 
"         \ map(split(system('fortune | cowsay -W 80 -f dragon'), '\n'), '"   ". v:val')

let g:startify_custom_footer = ""

nnoremap <leader><C-s> :Startify<cr>
"  }}}

" ---- Sidebar NERDTree ---- {{{
Plugin 'scrooloose/nerdtree'
noremap <silent> <C-\> :NERDTreeToggle<CR>
noremap <leader>\ :NERDTreeFind<CR>
let NERDTreeIgnore = [
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
        \ ]
        
" Git File marking for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'


" Custom indicator mappings for nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "*",
        \ "Staged"    : "+",
        \ "Untracked" : "",
        \ "Renamed"   : ">",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "x",
        \ "Dirty"     : "",
        \ "Clean"     : "",
        \ 'Ignored'   : '',
        \ "Unknown"   : ""
        \ }

"  }}}

" Minimap!
" Plugin 'severin-lemaignan/vim-minimap'


" Gutter for Vim, allows showing statuses beside lines of Code
Plugin 'airblade/vim-gitgutter'

" }}}

" --- Editor Config --- {{{

" ---- Movement and resizing ---- {{{

" Move lines like Atom {{{
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv
" }}}

" Remap Page up and Page down
noremap <S-k> <C-b> 
noremap <S-j> <C-f> 

noremap <C-w><C-Up> :res +5<cr> 
noremap <C-w><C-Down> :res -5<cr> 

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

"goto brace
nnoremap gb %
vnoremap gb %

" -- goto defintion in project -- {{{
nnoremap <silent> <leader>gd :call GotoProjectDefinition()<CR>

function! GotoProjectDefinition()
  normal viw"dy
  let class = @d
  call s:FindClass(class)
endfunction

function! FindTags(name, kinds)
  let tag_list = []

  for entry in taglist(a:name)
    if index(a:kinds, entry.kind) > -1
      call add(tag_list, entry)
    endif
  endfor

  return tag_list
endfunction

:autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
function! s:FindClass(name)
  let qflist = []
  " for entry in FindTags('^'.a:name.'\>', ['c', 'class'])
  for entry in FindTags('^'.a:name, ['c', 'class', 't', 'trait'])
    let filename = entry.filename
    let pattern  = substitute(entry.cmd, '^/\(.*\)/$', '\1', '')

    call add(qflist, {
          \ 'filename': filename,
          \ 'pattern':  pattern,
          \ })
  endfor

  if len(qflist) == 0
    echohl Error | echo "Class not found in tags." | echohl NONE
  elseif len(qflist) == 1
    call setqflist(qflist)
    silent cfirst
  else
    call setqflist(qflist)
    botright copen
  endif
endfunction
" }}}

" Thanks @ian-paterson  https://github.com/ian-paterson
"
" goto blade partials
" {{{
nnoremap <leader>pg :call GoToPartial()<CR>

function! GoToPartial()
  normal "lyi'
  let partial = @l
  let file = substitute(partial, "\\.", "/", "g")
  execute "edit resources/views/" . file . ".blade.php"
endfunction
" }}}

" Go to vue component
" {{{
nnoremap <leader>vg :call GoToVue()<CR>

function! GoToVue()
  execute "set isk+=-"
  normal "lyiw
  execute "set isk-=-"
  let filename = @l
  let file = system("find resources/assets/js -name " . filename . ".vue")
  execute "edit " . file
endfunction
" }}}

" }}}

" Dash Documentation plugin
Plugin 'rizzatti/dash.vim'

" Close all buffers except open one
Plugin 'vim-scripts/BufOnly.vim'

" Tmux-style Pane Zooming
Plugin 'dhruvasagar/vim-zoom'

nnoremap <leader>+ :<C-u>call zoom#toggle()<cr>

" delimiter assistance
Plugin 'Raimondi/delimitMate'

" ---- Easy Align ---- {{{
Plugin 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}

" ---- Tag Manager ---- {{{
" Plugin 'ludovicchabant/vim-gutentags'

" let g:gutentags_ctags_extra_args = [
"             \ '--PHP-kinds=cft',
"             \ '--exclude="node_modules"',
"             \ '--exclude="*.js"',
"             \ '--exclude="*.blade.php"',
"             \ '--languages="php"'
"             \ ]

" augroup MyGutentagsStatusLineRefresher
"     autocmd!
"     autocmd User GutentagsUpdating call lightline#update()
"     autocmd User GutentagsUpdated call lightline#update()
" augroup END

" :set statusline+=%{gutentags#statusline_cb(
            " \function('<SID>get_gutentags_status'))}

" }}}

" Git wrapper for vim
Plugin 'tpope/vim-fugitive'

" GV - git log browser
Plugin 'junegunn/gv.vim'

nnoremap <C-B> :Gblame<cr>

" ---- Tagbar ---- {{{
Plugin 'majutsushi/tagbar'
augroup tagbar
    let s:hidden_all = 1
    " autocmd BufRead *.py set noexpandtab
    autocmd FileType diff setlocal foldlevel=1000
    autocmd FileType diff nnoremap q :qa!<cr>
augroup END

nnoremap <silent> <C-s> :TagbarToggle<cr>
vnoremap <silent> <C-s> <esc>:TagbarOpen<cr> :TagbarCurrentTag<cr>
" }}}

" Managing quotations, surrounding brackets, etc. Made easier
Plugin 'tpope/vim-surround'

" Should keep me in root dir for commands like fzf
Plugin 'airblade/vim-rooter'

" ---- FZF Plugins for Fuzzy File Finding ---- {{{
if executable('fzf')
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
    
    nnoremap <silent> <C-p> :call fzf#run({'source': 'git ls-files --exclude-standard --others --cached', 'sink': 'e', 'down': '40%'})<cr>
    nnoremap <silent> <M-p> :Buffers<cr>
    nnoremap <silent> <M-S-p> :History<cr>
  
    " inoremap <expr> <c-x><c-k> fzf#vim#complete(:DashKeywords)
    let g:fzf_nvim_statusline = 0
    let g:fzf_action = {
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit'
          \ }
  
    command! LaraViews FZF resources/views/
    command! LaraControllers FZF app/http/controllers/
end
" }}}

" ---- Ack for Vim ---- {{{
Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space><Paste>

" Finding Keybinds for Ack
nnoremap <leader><C-f> :Ack!<Space>
vnoremap <leader><C-f> y :Ack!<Space><C-r>"
vnoremap <leader><S-f> y :%s/<C-r>"/
nnoremap <C-f> /
vnoremap <C-f> y /<C-r>"
" }}}

" ---- Twiddle Case Switcher ---- {{{
" function! TwiddleCase(str)
"   if a:str ==# toupper(a:str)
"     let result = tolower(a:str)
"   elseif a:str ==# tolower(a:str)
"     let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
"   else
"     let result = toupper(a:str)
"   endif
"   return result
" endfunction
" vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
" }}}

" ---- Can't live without Emmet ---- {{{
Plugin 'mattn/emmet-vim'

let g:user_emmet_leader_key='<leader>' 
let g:user_emmet_mode='n'

inoremap <C-Return> <cr><cr><C-o>k<Tab>
" }}}

" ---- Comment and Un-comment lines on the fly ---- {{{
Plugin 'tpope/vim-commentary'
" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
" Vim recognizes C-_ as C-/, so control+/ will toggle comments
noremap <C-_> :Commentary<cr>
" }}}

" ---- PHP Namespace and Use Statement support in Vim ---- {{{
Plugin 'arnaud-lb/vim-php-namespace'

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
augroup phpImports
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
    autocmd FileType php setlocal commentstring=//%s
augroup END
" }}}

" ---- phpDocumentor ---- {{{
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
let g:pdv_template_dir=expand($HOME) . "/.pdv-templates"
nnoremap <silent> <leader>d :call pdv#DocumentCurrentLine()<cr> 
" ---- }}}

" }}}

" --- Syntax --- {{{

" html5 omnicomplete
" Plugin 'othree/html5.vim'

" Better PHP Lang Support
Plugin 'StanAngeloff/php.vim' 
augroup php
autocmd!
autocmd BufNewFile,BufRead *.php setlocal foldlevel=2
augroup END

" Javascript
" Plugin 'othree/javascript-libraries-syntax.vim'
" let g:used_javascript_libs = 'underscore,jquery,vue'
augroup syntaxcommands
    autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
augroup END

" Highlight Hex colors
" Plugin 'etdev/vim-hexcolor'

" Laravel
Plugin 'jwalton512/vim-blade'
" Workaround to ensure correct filetypes for blade template syntax highlight
augroup blade
autocmd!
autocmd BufNewFile,BufRead *.blade.php setlocal filetype=blade
augroup END


" Async Linter Engine for Vim, allows phpcs, eslint etc. -- {{{
Plugin 'w0rp/ale'
let g:ale_linters = {
                    \ 'php': ['phpcs'],
                    \ 'swift': ['swiftlint']
                    \ }
let g:ale_php_phpcs_standard="XpBar"
let g:ale_php_phpcs_use_global=1
" }}}

Plugin 'file:///Users/nireland/swift/apple/swift', 
            \ {'rtp': 'utils/vim/','name': 'Swift-Syntax'}
autocmd BufNewFile,BufRead *.swift set syntax=swift

" xdebug for vim
Plugin 'vim-vdebug/vdebug'
let g:vdebug_options = {
        \ 'break_on_open' : '0'
        \ }

let g:vdebug_keymap = {
    \ "run" : "<F5>",
    \ "run_to_cursor" : "<F9>",
    \ "step_over" : "<F2>",
    \ "step_into" : "<F3>",
    \ "step_out" : "<F4>",
    \ "close" : "<F6>",
    \ "detach" : "<F7>",
    \ "set_breakpoint" : "<F10>",
    \ "get_context" : "<F11>",
    \ "eval_under_cursor" : "<F12>",
    \ "eval_visual" : "<Leader>e",
    \ }

nnoremap <silent> <M-b> :Breakpoint<cr>
nnoremap <silent> <M-r> :BreakpointRemove *<cr>
" }}}

" --- Themimg --- {{{

" ---- Lightline for Vim ---- {{{

Plugin 'itchyny/lightline.vim'

" Hide -- INSERT --
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'two',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ] ]
      \ },
      \ 'component_function': {
      \   'mode': 'LightLineMode',
      \   'gitbranch': 'fugitive#head',
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
let g:airline#extensions#tabline#enabled = 1
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

" Plugin 'chrisbra/Colorizer'

" nnoremap <leader>cc :ColorToggle<cr>
" nnoremap <leader>ct :ColorContrast<cr>

syntax on

nnoremap <C-[> :syn off<cr> :syn on<cr> 

" }}}

" --- Fun Stuff --- {{{

" unmap from emmet to use with splits
unmap <leader>vg

" Plugin 'jerrymarino/SwiftPlayground.vim'

" augroup qQuit
"     autocmd FileType diff nnoremap q :qa!<cr>
"     autocmd FileType man nnoremap q :qa!<cr>
" augroup END


" autocmd VimEnter *
            " \   if !argc()
            " \ |   Startify
            " \ |   NERDTree
            " \ |   wincmd w
            " \ | endif

"
" Plugin 'ryanoasis/vim-devicons'
" let g:WebDevIconsOS='Darwin'
" set guifont=DroidSansMono\ Nerd\ Font\ 11

" }}}

" ===========================================================================

call vundle#end()            " required
filetype plugin indent on    " required
