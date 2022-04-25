" don't touch this scripts {{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
call dein#begin('$HOME/.cache/dein')

" Let dein manage dein

" load toml files {{{
let s:toml_dir = g:root_path . '/dein'
let s:toml = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})
" }}}

" Add or remove your plugins here like this: {{{
let g:dein#install_process_timeout = 240
" }}}

" Required: {{{
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
call dein#recache_runtimepath()
" }}}
