set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" #home
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



" #general
" ---------------------------------------------------------------------------
"                            ▞▀▖               ▜
"                            ▌▄▖▞▀▖▛▀▖▞▀▖▙▀▖▝▀▖▐
"                            ▌ ▌▛▀ ▌ ▌▛▀ ▌  ▞▀▌▐
"                            ▝▀ ▝▀▘▘ ▘▝▀▘▘  ▝▀▘ ▘
" ---------------------------------------------------------------------------

map <Space> <leader>

function! SetupCommandAlias(from, to)
exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" Clear highlight after search
nnoremap <silent><cr> :noh<CR><CR>:<backspace>

" Quick Open vimrc while vim is open
nnoremap <silent><leader>ev :vsplit $MYVIMRC<cr>

" Quick Open vimrc while vim is open
nnoremap <silent><leader>en :split $MYVIMRC<cr>

nnoremap <leader>w :w<cr>

" Splits
nnoremap <leader>v :vsp<cr>
nnoremap <leader>n :sp<cr>
vnoremap <leader>v :vsp<cr>
vnoremap <leader>n :sp<cr>

nnoremap <silent><leader>q :bd<cr>

" nnoremap <silent><A-,>:vertical resize +5<cr>

iabbrev adn and 
iabbrev waht what
iabbrev tehn then
iabbrev @@ nick@nicholasireland.ca
iabbrev ccopy Copyright 2018 Nicholas Ireland, all rights reserved.
iabbrev iff if ()<left>
iabbrev \rr\ RoomRoster\


" Auto Commands
augroup buffercmds 
autocmd!
" Indent HTML files on save
autocmd BufWritePre *.html :normal gg=G

" No linewrap html
autocmd BufNewFile,BufRead *.html setlocal nowrap

" Spellcheck Markdown 
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us

" No linewrap html
autocmd BufNewFile,BufRead *.php setlocal nowrap
augroup END


" change between parens
onoremap in( :<c-u>normal! f(vi(<cr>

" Stop using the Arrow keys in normal mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Map Leader space to commands
noremap <leader><Space> :

" Unbind <esc>
inoremap <esc> <nop>
" Use jk instead of <esc> 
inoremap jk <esc>
vnoremap jk <esc>


" Tab commands with leader
" nnoremap <leader>t :tabnew<cr>
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

" Surround word with "'s
" nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Vundle Plugin Manager manages itself, like npm
Plugin 'VundleVim/Vundle.vim'

" Navigate Tmux and Vim Seamlessly
Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" halve the wait time for multi-key keybinds
set ttm=25


" #ui
" ---------------------------------------------------------------------------
"                   ▌ ▌          ▜▘   ▐        ▗▀▖
"                   ▌ ▌▞▀▘▞▀▖▙▀▖ ▐ ▛▀▖▜▀ ▞▀▖▙▀▖▐  ▝▀▖▞▀▖▞▀▖
"                   ▌ ▌▝▀▖▛▀ ▌   ▐ ▌ ▌▐ ▖▛▀ ▌  ▜▀ ▞▀▌▌ ▖▛▀
"                   ▝▀ ▀▀ ▝▀▘▘   ▀▘▘ ▘ ▀ ▝▀▘▘  ▐  ▝▀▘▝▀ ▝▀▘
" ---------------------------------------------------------------------------

" Startup Screen
Plugin 'mhinz/vim-startify'
" Startify config
let g:startify_bookmarks = [
        \ {'i' : '~/swift/roomroster'},
        \ {'r' : '~/Sites/RoomRoster'},
        \ {'m' : '~/Sites/wp/mdm/wp-content/themes/mdm-reporting'},
        \ {'v' : '~/.vimrc'},
        \ {'t' : '~/.tmux.conf'},
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

" let g:startify_custom_footer = 
"         \ map(split(system('fortune | cowsay -W 80 -f dragon'), '\n'), '"   ". v:val')

let g:startify_custom_footer = ""

nnoremap <leader><C-s> :Startify<cr>

" Sidebar NERDTree
Plugin 'scrooloose/nerdtree'
noremap <C-\> :NERDTreeToggle<CR>
noremap <leader>\ :NERDTreeFind<CR>

" Git File marking for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'


" Custom indicator mappings for nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "*",
        \ "Staged"    : "+",
        \ "Untracked" : "",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "x",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }


" Minimap!
Plugin 'severin-lemaignan/vim-minimap'


" Gutter for Vim, allows showing statuses beside lines of Code
Plugin 'airblade/vim-gitgutter'



" #editor
" ---------------------------------------------------------------------------
"                           ▛▀▘  ▌▗▐
"                           ▙▄ ▞▀▌▄▜▀ ▞▀▖▙▀▖
"                           ▌  ▌ ▌▐▐ ▖▌ ▌▌
"                           ▀▀▘▝▀▘▀▘▀ ▝▀ ▘
" ---------------------------------------------------------------------------

set number numberwidth=4
set shiftwidth=4  " operation >> indents 2 columns; << unindents 2 columns
set tabstop=4     " a hard TAB displays as 2 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set conceallevel=0
set ignorecase
set smartcase
set mousefocus
set mouse=a
set hidden

" Autoread files to watch for changes outside of vim
set autoread
augroup autoreload
    autocmd!
    " Thanks, Stack Overflow: https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END

set foldmethod=manual
set foldlevel=1
set nowrap
" 
" Move lines like Atom
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

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

" Dash Documentation plugin
Plugin 'rizzatti/dash.vim'

" Close all buffers except open one
Plugin 'vim-scripts/BufOnly.vim'

" Tmux-style Pane Zooming
Plugin 'dhruvasagar/vim-zoom'

nnoremap <leader>+ :<C-u>call zoom#toggle()<cr>

" " Undo Tree for vim
" Plugin 'sjl/gundo.vim'
" nnoremap <leader>g :GundoToggle<cr>

" delimiter assistance
Plugin 'Raimondi/delimitMate'


Plugin 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" tags manager
Plugin 'ludovicchabant/vim-gutentags'

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

function! s:get_gutentags_status(mods) abort
    let l:msg = ''
    if index(a:mods, 'ctags') >= 0
       let l:msg .= '♨'
     endif
     if index(a:mods, 'cscope') >= 0
       let l:msg .= '♺'
     endif
     return l:msg
endfunction

:set statusline+=%{gutentags#statusline_cb(
            \function('<SID>get_gutentags_status'))}



" Git wrapper for vim
Plugin 'tpope/vim-fugitive'

nnoremap <C-B> :Gblame<cr>

" View Tags in Vim
Plugin 'majutsushi/tagbar'
augroup tagbar
    autocmd vimenter * TagbarOpen
augroup END
nnoremap <C-s> :TagbarToggle<cr>
vnoremap <C-s> <esc>:TagbarOpen<cr> :TagbarCurrentTag<cr>

" Managing quotations, surrounding brackets, etc. Made easier
Plugin 'tpope/vim-surround'

" Should keep me in root dir for commands like fzf
Plugin 'airblade/vim-rooter'

" FZF Plugins for Fuzzy File Finding
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
noremap <C-p> :FZF -i<cr>
" inoremap <expr> <c-x><c-k> fzf#vim#complete(:DashKeywords)

" Ack for Vim
Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space><Paste>

" Finding Keybinds for Ack
nnoremap <leader><C-f> :Ack!<Space>
vnoremap <leader><C-f> y :Ack!<Space><C-r>"
vnoremap <leader><S-f> y :%s/<C-r>"/
nnoremap <C-f> /
vnoremap <C-f> y /<C-r>"

" Twiddle Case Switcher
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv


" Can't live without Emmet
Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key='<leader>' 

" Comment and Un-comment lines on the fly
Plugin 'tpope/vim-commentary'
" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
" Vim recognizes C-_ as C-/, so control+/ will toggle comments
noremap <C-_> :Commentary<cr>


" PHP Namespace and Use Statement support in Vim
Plugin 'arnaud-lb/vim-php-namespace'
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
augroup phpImports
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
augroup END


" Thanks @ian-paterson  https://github.com/ian-paterson
"
" goto blade partials
nnoremap <leader>pg :call GoToPartial()<CR>

function! GoToPartial()
  normal "lyi'
  let partial = @l
  let file = substitute(partial, "\\.", "/", "g")
  execute "edit resources/views/" . file . ".blade.php"
endfunction

" Go to vue component
nnoremap <leader>vg :call GoToVue()<CR>

function! GoToVue()
  execute "set isk+=-"
  normal "lyiw
  execute "set isk-=-"
  let filename = @l
  let file = system("find resources/assets/js -name " . filename . ".vue")
  execute "edit " . file
endfunction

" #syntax
" ---------------------------------------------------------------------------
"                           ▞▀▖      ▐
"                           ▚▄ ▌ ▌▛▀▖▜▀ ▝▀▖▚▗▘
"                           ▖ ▌▚▄▌▌ ▌▐ ▖▞▀▌▗▚
"                           ▝▀ ▗▄▘▘ ▘ ▀ ▝▀▘▘ ▘
" ---------------------------------------------------------------------------

" Better PHP Lang Support
Plugin 'StanAngeloff/php.vim' 

" Javascript
Plugin 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'underscore,jquery,vue'

autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS

" Highlight Hex colors
Plugin 'etdev/vim-hexcolor'

" Laravel
Plugin 'jwalton512/vim-blade'
" Workaround to ensure correct filetypes for blade template syntax highlight
augroup blade
autocmd!
autocmd BufNewFile,BufRead *.blade.php set filetype=blade
augroup END


" Async Linter Engine for Vim, allows phpcs, eslint etc.
Plugin 'w0rp/ale'
let g:ale_linters = {
                    \ 'php': ['phpcs'],
                    \ 'swift': ['swiftlint']
                    \ }
let g:ale_php_phpcs_standard="XpBar"
let g:ale_php_phpcs_use_global=1

Plugin 'file:///Users/nireland/swift/apple/swift', 
            \ {'rtp': 'utils/vim/','name': 'Swift-Syntax'}
autocmd BufNewFile,BufRead *.swift set syntax=swift

" #theming
" ---------------------------------------------------------------------------
"                           ▀▛▘▌         ▗
"                            ▌ ▛▀▖▞▀▖▛▚▀▖▄ ▛▀▖▞▀▌
"                            ▌ ▌ ▌▛▀ ▌▐ ▌▐ ▌ ▌▚▄▌
"                            ▘ ▘ ▘▝▀▘▘▝ ▘▀▘▘ ▘▗▄▘
" ---------------------------------------------------------------------------

" Lightline for Vim
Plugin 'itchyny/lightline.vim'
" Hide -- INSERT --
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'two',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

if (has("termguicolors"))
    set termguicolors
else
    set notermguicolors
endif

set background=dark " for the dark version
colorscheme two


syntax on

nnoremap <C-[> :syn off<cr> :syn on<cr> 

" #fun
" ---------------------------------------------------------------------------
"                      ▛▀▘       ▞▀▖▐     ▗▀▖▗▀▖
"                      ▙▄ ▌ ▌▛▀▖ ▚▄ ▜▀ ▌ ▌▐  ▐
"                      ▌  ▌ ▌▌ ▌ ▖ ▌▐ ▖▌ ▌▜▀ ▜▀
"                      ▘  ▝▀▘▘ ▘ ▝▀  ▀ ▝▀▘▐  ▐
" ---------------------------------------------------------------------------

" unmap from emmet to use with splits
unmap <leader>vg

Plugin 'jerrymarino/SwiftPlayground.vim'


autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
" ===========================================================================

call vundle#end()            " required
filetype plugin indent on    " required
