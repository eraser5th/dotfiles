" git などの更新がデフォルトで4000msと遅いので早める
set updatetime=250
set nocompatible

" Search {{{
set hlsearch   " 検索文字列に色を付ける
set ignorecase " 検索時に大文字小文字を区別しない (noignorecase:区別する)
set smartcase  " 大文字小文字の両方が含まれている場合は大文字小文字を区別
set wrapscan   " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
"set gdefault   " 置換時に「/g」をデフォルトで有効にする
" }}}

" Edit {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set backspace=indent,eol,start
set showmatch
set matchtime=1
set matchpairs+=<:>
set wildmenu
set wildignorecase
set formatoptions+=mM          " テキスト挿入中の自動折り返しを日本語に対応させる
set nrformats=alpha
" Edit }}}

" Display {{{
set number
set cursorline
set ruler
set list
set wrap
set breakindent
set linebreak
syntax on
set pumheight=10    " 補完メニューの高さ(デフォルト：0(無制限))
" Display }}}

" Cursor {{{
set whichwrap=b,s,h,l " hやlによるカーソル移動で行をまたぐようにする 初期値：b,s
set scrolloff=8
" Cursor }}}

" Mouse {{{
set mouse=a
" Mouse }}}

if !has('nvim')
  set term=xterm-256color
endif


" swap backup undo {{{
set swapfile
set directory=~/.vim/swap
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo
" swap backup undo }}}

" Clipboard {{{
set clipboard=unnamed
" Clipboard }}}

" time out {{{
set timeout timeoutlen=800
AutoCmd InsertLeave * set timeout timeoutlen=800
AutoCmd InsertEnter * set timeout timeoutlen=300
" time out }}}

" foldmethod {{{
AutoCmd FileType * setlocal foldmethod=marker foldlevel=100
AutoCmd FileType * setlocal foldmethod=syntax foldlevel=100
"set foldcolumn=4
" }}}

set guifont=VictorMono\ Nerd\ Font:h13
