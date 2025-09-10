set nocompatible

call plug#begin('~/.vim/bundle')

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
