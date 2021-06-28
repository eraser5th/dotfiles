"基本設定------------------------------------------- {{{
" set集 {{{
set number
" タブ類 {{{
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
" }}}
set completeopt=menuone,noinsert
set laststatus=2
set cursorline
set incsearch
set hlsearch
set showmatch
set matchtime=1
set pumheight=10
set whichwrap=h,l
set clipboard=unnamed
set backspace=indent,eol,start
" バックアップ類の所在 {{{
set swapfile
set directory=~/.vim/swap
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo
" }}}
" }}}
" キーバインド {{{
let mapleader = "\<Space>"
" nnormaps {{{
nnoremap <Leader>+ <C-a>
nnoremap <Leader>- <C-x>
nnoremap <Leader>w<CR> :w<CR>
nnoremap <Leader>wq<CR> :wq<CR>
nnoremap <Leader>j 7j
nnoremap <Leader>k 7k
nnoremap <Leader>h 0
nnoremap <Leader>j $
nnoremap <Leader>jd gD
nnoremap <Leader>jp gd
nnoremap <Leader><Leader> :
nnoremap <Leader>' :terminal<CR>
nnoremap x "_x
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nmap <Leader>w [WINDOW]
  nnoremap [WINDOW]h <C-W>
  nnoremap [WINDOW]v :vs<CR>
  nnoremap [WINDOW]s :split<CR>
  nnoremap [WINDOW]d :q!<CR>
nmap <Leader>t [TAB]
  nnoremap [TAB]l gt
  nnoremap [TAB]h gT
  nnoremap [TAB]L :+tabmove<CR>
  nnoremap [TAB]H :-tabmove<CR>
  nnoremap [TAB]d :tabclose<CR>
  nnoremap [TAB]n :tabnew<CR>
nnoremap <Leader>n :ERDTree<CR>
nnoremap <Leader>e <Plug>(easymotion-prefix)
" }}}
" inoremaps {{{
inoremap jj <Esc>
inoremap fd <Esc>
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap '' ''<esc>i
inoremap "" ""<esc>i
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
" }}}
" vnoremaps {{{
" }}}
" tnoremap {{{
" }}}
"
" }}}
" 折り畳み 
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType cpp setlocal foldmethod=syntax
"set foldcolumn=4
" 
" カラースキーム {{{
colorscheme desert
" }}}
"基本設定終了--------------------------------------- }}}

"dein.vimのセッティング----------------------------- {{{
"dein Scripts----------------------------- {{{
if &compatible
  set nocompatible               " Be iMproved
endif
" }}}
" Required: {{{
set runtimepath+=/Users/katotake/.cache/dein/repos/github.com/Shougo/dein.vim
" }}}
" Required: {{{
call dein#begin('/Users/katotake/.cache/dein')
" }}}
" Let dein manage dein {{{
" Required:
call dein#add('/Users/katotake/.cache/dein/repos/github.com/Shougo/dein.vim')
" }}}
" Add or remove your plugins here like this: {{{
let g:dein#install_process_timeout = 240
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('easymotion/vim-easymotion')
call dein#add('sjl/gundo.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/nerdtree')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('sheerun/vim-polyglot')
call dein#add('junegunn/vim-easy-align')
" }}}
" Required: {{{
call dein#end()
" }}}
" Required: {{{
filetype plugin indent on
syntax enable
" }}}
" If you want to install not installed plugins on startup. {{{
if dein#check_install()
  call dein#install()
endif
" }}}
"End dein Scripts------------------------------------ }}}
" NERDTreeの設定 {{{
nnoremap <silent>== :NERDTree<CR>
" vim開始時にNERDTreeを開く {{{
"autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" }}}

" }}}
"Netrw（ディレクトリの表示など）の設定 {{{
" :eを使うときに候補を表示 {{{
set wildmenu
" }}}
"ツリー表示 {{{
"表示を変更したい場合は i で切替可能
let g:netrw_liststyle=3
"上部のバナーを非表示
" I で toggle 可能
let g:netrw_banner = 0
"window サイズ
let g:netrw_winsize = 80
"Netrw で Enter 押下時の挙動設定
let g:netrw_browse_split = 2 
let g:netrw_alto = 0
" }}}
"Netrw を toggle する関数を設定 {{{
"元処理と異なり Vex を呼び出すことで左 window に表示 {{{
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vex
    endif
endfunction
" }}}

" }}}
" }}}
packloadall
silent! helptags ALL
