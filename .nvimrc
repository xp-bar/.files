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

" -- Buffers -- {{{
" Nicer buffer closing {{{
Plugin 'moll/vim-bbye'
nnoremap <leader>q :Bdelete<cr>
" }}}
" Buffer switching {{{
nnoremap <leader>j :bnext<cr>
nnoremap <leader>k :bprev<cr>
nnoremap <silent> <S-j> :bnext<cr>
nnoremap <silent> <S-k> :bprev<cr>
" }}}
" -- }}}

" Splits
" {{{
nnoremap <leader>\| :vsp<cr>
nnoremap <leader>_ :sp<cr>
vnoremap <leader>\| :vsp<cr>
vnoremap <leader>_ :sp<cr>
nnoremap <leader>x :q<cr>
vnoremap <leader>x :q<cr>
" }}}
"
vnoremap <leader>a <esc>ggVG"*y

cnoreabbrev ww setl wrap!|setl lbr!

nnoremap <silent><esc><esc> :set nopaste<cr>

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

" let g:startify_custom_header = 
"             \ map(split(system('fortune -s -n $[$(tput cols)/4] | toilet -f "Stick Letters" -w $[$(tput cols) + 100]'), '\n'), '"   ". v:val')

let g:startify_custom_footer = 
        \ map(split(system('fortune | cowsay -W 80 -f tux'), '\n'), '"   ". v:val')

" let g:startify_custom_footer = ""
let g:startify_custom_header = ""

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

" --- Minimap --- {{{
" Plugin 'severin-lemaignan/vim-minimap'
" --- }}}

" --- GitGutter --- {{{
" Gutter for Vim, allows showing statuses beside lines of Code
Plugin 'airblade/vim-gitgutter'
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
let g:goyo_width = 80
nnoremap <silent><leader>y :Goyo<cr>
" --- }}}

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
nnoremap <silent> <leader>gl :Lines<CR>

:autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

function! GotoProjectDefinition()
    normal viw"dy
    let name = @d
    if match(name, "^[A-Z]")
        call s:FindTagsOfTypeFZF(name, ['f', 'function'])
    else
        if match(name, "^[A-Z][A-Z]")
            call s:FindTagsOfTypeFZF(name, ['c', 'class', 't', 'trait', 'i', 'interface'])
        else
            call s:FindTagsOfTypeFZF(name, ['d'])
        endif
    endif
endfunction

" FindTags helper {{{
function! FindTags(name, kinds)
  let tag_list = []

  for entry in taglist(a:name)
    if index(a:kinds, entry.kind) > -1
      call add(tag_list, entry)
    endif
  endfor

  return tag_list
endfunction
" }}}

" Mapped helper {{{
function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction
" }}}

" s:FindTagsOfTypeFZF {{{
function! s:FindTagsOfTypeFZF(name, types)
  let qflist = []
  for entry in FindTags('^'.a:name.'\>', a:types)
    let filename = entry.filename
    let pattern  = substitute(entry.cmd, '^/\(.*\)/$', '\1', '')

    call add(qflist, {
          \ 'filename': filename,
          \ 'pattern':  pattern,
          \ })
  endfor

  if len(qflist) == 0
    echohl Error | echo "Class / Trait / Function not found in tags." | echohl NONE
  elseif len(qflist) == 1
    call setqflist(qflist)
    silent cfirst
  else
      function! s:align_lists(lists)
          let maxes = {}
          for list in a:lists
              let i = 0
              while i < len(list)
                  let maxes[i] = max([get(maxes, i, 0), len(list[i])])
                  let i += 1
              endwhile
          endfor
          for list in a:lists
              call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
          endfor
          return a:lists
      endfunction

      function! s:sink(line)
          let l:split = split(a:line, " => ")
          let l:file = l:split[1]
          let l:search = substitute(l:split[0], '\', '\\\\\\\\', 'g')
          let l:search = substitute(l:search, ' ', '\\ ', 'g')
          let l:search = substitute(l:search, ' $', '', 'g')
          exe "edit +/.*" . l:search . ".* " .l:file
      endfunction

      " call setqflist(qflist)
      " botright copen
      "
      function! s:stylizeTag(key, val, name)
          let l:result = a:val['pattern']
          let l:result = substitute(l:result, '^\^', '', '')
          let l:result = substitute(l:result, '\$$', '', '')
          let l:result = substitute(l:result, '\zs' . a:name . '\ze', "\e[4m\e[35m" . a:name . "\e[0m", '')
          return result . " \e[30m => " .  a:val['filename'] . "\e[0m" 
      endfunction

      call fzf#run({
                  \ 'title': a:name,
                  \ 'options': "--ansi --preview='cat $(echo {} | sed \"s/^.*=>//g\") | grep namespace'",
                  \ 'source': map(qflist, {key, val -> s:stylizeTag(key, val, a:name)}),
                  \ 'sink': function('s:sink'),
                  \ 'down': '50%'
                  \ })
  endif
endfunction
" }}}
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

" Custom function to wrap a line in debugbar wrappers
function! s:DebugBar(key)
    normal O\Debugbar::startMeasure('REPLACE_ME', 'REPLACE_ME');jk
    let replacement = a:key
    let line = getline('.')
    let result = substitute(line, "REPLACE_ME", replacement, "g")
    call setline('.', result)
    normal jo\Debugbar::stopMeasure('REPLACE_ME');jk
    let line = getline('.')
    let result = substitute(line, "REPLACE_ME", replacement, "g")
    call setline('.', result)
    normal k_
endfunction

command! -nargs=1 DebugBar call s:DebugBar(<f-args>)

" ---- Tag Manager ---- {{{
" Plugin 'ludovicchabant/vim-gutentags'

" let g:gutentags_ctags_extra_args = [
"             \ '--PHP-kinds=cfmt',
"             \ '--exclude="node_modules"',
"             \ '--exclude="*.js"',
"             \ '--exclude="*.blade.php"',
"             \ '--languages="php"'
"             \ ]

" augroup MyGutentagsStatusLineRefresher
    " autocmd!
"     autocmd User GutentagsUpdating call lightline#update()
"     autocmd User GutentagsUpdated call lightline#update()
" augroup END

" :set statusline+=%{gutentags#statusline_cb(
            " \function('<SID>get_gutentags_status'))}

" }}}

" Git wrapper for vim
Plugin 'tpope/vim-fugitive'

nnoremap <silent><C-B> :Gblame<cr>

" GV - git log browser
Plugin 'junegunn/gv.vim'
nnoremap <silent><leader>g :GV<cr>

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

" The missing motion - sneak
Plugin 'justinmk/vim-sneak'

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

    function! s:file_tags_source()
        return 'cat ' . join(tagfiles()) . " | grep " . expand("%:t") . " | awk 'match($5, /[fm]/)'"
    endfunction

    function! s:tags_source()
        return 'cat ' . join(tagfiles()) . " | awk 'match($5, /[fm]/)'"
    endfunction
	
	function! s:tag_handler(tag)
	    if !empty(a:tag)
	        let token = split(split(a:tag, '\t')[2],';"')[0]
            echom token
	        let m = &magic
	        setlocal nomagic
	        execute token
	        if m
	            setlocal magic
	        endif
	    endif
	endfunction

    command! FZFTagFile if !empty(tagfiles()) | call fzf#run({
		\ 'source': s:file_tags_source(),
		\ 'sink': function('<sid>tag_handler'),
		\ 'options': '+m --with-nth=1',
		\ 'down': '50%'
		\ }) | else | echo 'No tags' | endif

    command! FZFTags if !empty(tagfiles()) | call fzf#run({
		\ 'source': s:tags_source(),
		\ 'sink': function('<sid>tag_handler'),
		\ 'options': '+m --with-nth=1',
		\ 'down': '50%'
		\ }) | else | echo 'No tags' | endif
end
" }}}

" ---- Ack for Vim ---- {{{
Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space><Paste>

" Finding Keybinds for Ack
nnoremap <leader><C-f> :Ack!<Space>
vnoremap <leader><C-f> y :Ack!<Space><C-r>"
" vnoremap <leader><S-f> "py :%s/<C-r>"/
vnoremap <leader><S-f> :call VReplacer()<cr>
nnoremap <leader><S-f> :call FReplacer()<cr>

function! VReplacer() range
    exe "normal gv\"py"
    let l:replace = input("Replace what? ")
    let l:replacement = input("Replace '" . l:replace . "' with: ")
    exe a:firstline . "," . a:lastline . "s/\zs" . l:replace . "\ze/" . l:replacement . "/g"
endfunction

function! FReplacer() range
    let l:replace = input("Replace what? ")
    let l:replacement = input("Replace '" . l:replace . "' with: ")
    exe "%s/\\zs" . l:replace . "\\ze/" . l:replacement . "/g"
endfunction

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

let g:php_namespace_sort_after_insert=1

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



" ---- Conquer of Completion {{{
Plugin 'neoclide/coc.nvim'
" ---- }}}

" Add a namespace declaration - php {{{
function! NameSpace()
    if (&ft=='php')
        let l:root = $ROOT_NAMESPACE != "" ? $ROOT_NAMESPACE : 'Root'
        let l:file = @%
        let l:path = matchstr(l:file, '^\zs.*\ze\/.*\..*$')
        let l:parsed = substitute(l:path, '^\zsapp\ze', l:root, '')
        let l:namespace = 'namespace ' . substitute(l:parsed, '\/', '\', 'g') .';'
        exe "normal ggj"
        exe "normal \i\<cr>\<esc>" 
        call setline('.', l:namespace)
        exe "normal \o\<esc>" 
    endif
endfunction

function! ReturnType()
    if (&ft=='php')
        " exe "normal ?@return[ ]\zs.*\ze$<CR>"
        " exe "normal \"lyw"
        " exe "normal $i:<esc>"
        " exe "normal \"lp"
    endif
endfunction

augroup phpNamespace
    autocmd FileType php noremap <Leader>n :call NameSpace()<CR>
    autocmd FileType php noremap <Leader>r :call ReturnType()<CR>
augroup END

" }}}
"
" ---- phpDocumentor ---- {{{
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
let g:pdv_template_dir=expand($HOME) . "/.pdv-templates"
nnoremap <silent> <leader>d :call pdv#DocumentCurrentLine()<cr> 
" ---- }}}

" }}}

" --- Syntax --- {{{

" html5 omnicomplete
Plugin 'othree/html5.vim'

" Scss support
Plugin 'cakebaker/scss-syntax.vim'

" Better PHP Lang Support
Plugin 'StanAngeloff/php.vim' 
augroup php
autocmd!
autocmd BufNewFile,BufRead *.php setlocal foldlevel=2
augroup END

" Javascript
Plugin 'pangloss/vim-javascript'

inoreabbrev clog console.log();<Left><Left>
inoreabbrev cgroup console.group();<cr><cr>console.log();<cr><cr>console.groupEnd();

" Vue
Plugin 'posva/vim-vue'

" disable pre-processors bc they're breaking things
" let g:vue_disable_pre_processors=1
" Typescript and Vue
Plugin 'Quramy/tsuquyomi'
Plugin 'Quramy/tsuquyomi-vue'

augroup syntaxcommands
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType sass setlocal omnifunc=csscomplete#CompleteCSS
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.css
    autocmd BufRead,BufNewFile *.vue setlocal commentstring=//%s
    autocmd FileType vue syntax sync fromstart
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

Plugin 'leafgarland/typescript-vim'

augroup typescript
autocmd!
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
augroup END

" Async Linter Engine for Vim, allows phpcs, eslint etc. -- {{{
Plugin 'w0rp/ale'
let g:ale_linters = {
                    \ 'php': ['phpcs', 'phpstan'],
                    \ 'swift': ['swiftlint']
                    \ }
let g:ale_php_phpcs_standard="XpBar"
let g:ale_php_phpcs_use_global=1
" }}}
"
" -- PHPStan -- {{{
Plugin 'phpstan/vim-phpstan'

function! Stanley()
    let l:filename=@%
    call phpstan#PHPStanAnalyse(l:filename)
endfunction
" }}}

Plugin 'file:///Users/nireland/swift/apple/swift', 
            \ {'rtp': 'utils/vim/','name': 'Swift-Syntax'}
autocmd BufNewFile,BufRead *.swift set syntax=swift

" xdebug for vim
Plugin 'vim-vdebug/vdebug'
let g:vdebug_options = {
        \ 'break_on_open' : '1'
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

nnoremap <silent> <C-[> :syn sync fromstart<cr>
" nnoremap <C-[> :syn off<cr> :syn on<cr> :syn sync fromstart<cr>

" }}}

" --- Fun Stuff --- {{{

" unmap from emmet to use with splits
unmap <leader>vg

nnoremap <leader>[ :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft

  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif

  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry

  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif

  execute 'syntax region '.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start=/'.a:start.'/ end=/'.a:end.'/
  \ keepend
  \ contains=@'.group
endfunction

augroup mdSyntaxes
    autocmd!
    " autocmd BufEnter *.md call TextEnableCodeSnip('php', '^```php', '^```', 'phpRegion')
    " autocmd BufEnter *.md call TextEnableCodeSnip('vue', '^```vue', '^```', 'jsRegion')
    " autocmd BufEnter *.md call TextEnableCodeSnip('markdown', '```\[^php\]', '```php', 'markdown')
augroup END
" }}}

" ===========================================================================

call vundle#end()            " required
filetype plugin indent on    " required
