let mapleader = "\<Space>"

" Mappings {{{2
"---------------------------------------------------------------------|
"  Modes     | N | I | Command | V | Select | Operator | T | Lang-Arg |
" [nore]map  | @ | - |    -    | @ |   @    |    @     | - |    -     |
" n[nore]map | @ | - |    -    | - |   -    |    -     | - |    -     |
" n[orem]ap! | - | @ |    @    | - |   -    |    -     | - |    -     |
" i[nore]map | - | @ |    -    | - |   -    |    -     | - |    -     |
" c[nore]map | - | - |    @    | - |   -    |    -     | - |    -     |
" v[nore]map | - | - |    -    | @ |   @    |    -     | - |    -     |
" x[nore]map | - | - |    -    | @ |   -    |    -     | - |    -     |
" s[nore]map | - | - |    -    | - |   @    |    -     | - |    -     |
" o[nore]map | - | - |    -    | - |   -    |    @     | - |    -     |
" t[nore]map | - | - |    -    | - |   -    |    -     | @ |    -     |
" l[nore]map | - | @ |    @    | - |   -    |    -     | - |    @     |
"---------------------------------------------------------------------"

inoremap kj <Esc>
inoremap fd <Esc>
inoremap jj <Esc>
" inoremap <silent> <Left>  <Cmd>vertical resize -1<CR>
" inoremap <silent> <Right> <Cmd>vertical resize +1<CR>
" inoremap <silent> <Up>    <Cmd>resize -1<CR>
" inoremap <silent> <Down>  <Cmd>resize +1<CR>

nnoremap <Esc><Esc> :noh<CR><Esc>

nnoremap j gj
nnoremap k gk
nnoremap <S-h> 0
nnoremap <S-l> $
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-a> <Nop>
nnoremap <C-x> <Nop>
nnoremap Y y$
nnoremap p ]p
nnoremap P ]P
nnoremap x "_x
nnoremap <Leader>h 0
nnoremap <Leader>j 7j
nnoremap <Leader>k 7k
nnoremap <Leader>l $

" window {{{
nmap <Leader>w [window]
  nnoremap [window] <Leader>w
  nnoremap [window]s <C-w>s
  nnoremap [window]v <C-w>v
  nnoremap [window]w <C-w>w
  nnoremap [window]r <C-w>r
  nnoremap [window]h <C-w>h
  nnoremap [window]j <C-w>j
  nnoremap [window]k <C-w>k
  nnoremap [window]l <C-w>l

if has('nvim')
  function! s:focus_floating() abort
    if !empty(nvim_win_get_config(win_getid()).relative)
      wincmd p
      return
    endif
    for winnr in range(1, winnr(' '))
      let winid = win_getid(winnr)
      let conf = nvim_win_get_config(winid)
      if conf.focusable && !empty(conf.relative)
        call win_gotoid(winid)
        return
      endif
    endfor
    execute "normal! \<C-w>\<C-w>"
  endfunction
  nnoremap <silent> <C-w><C-w> <Cmd>call <SID>focus_floating()<CR>
endif

" window }}}

" resize {{{
nmap <Leader>r [resize]
  nnoremap [resize]h <C-w>H
  nnoremap [resize]j <C-w>J
  nnoremap [resize]k <C-w>K
  nnoremap [resize]l <C-w>L
" nnoremap <Left> 3<C-W><
" nnoremap <Right> 3<C-W>>
" nnoremap <Up> 2<C-W>+
" nnoremap <Down> 2<C-W>-
" resize }}}
"
" tab {{{
nmap <Leader>t [tab]
  nnoremap [tab]l gt
  nnoremap [tab]h gT
  nnoremap [tab]L :+tabmove<CR>
  nnoremap [tab]H :-tabmove<CR>
  nnoremap [tab]d :tabclose<CR>
  nnoremap [tab]n :tabnew<CR>
  nnoremap [tab]ml :+tabmove<CR>
  nnoremap [tab]mh :-tabmove<CR>
" tab }}}

" terminal {{{
nnoremap <Leader>' :terminal<CR>
tnoremap kj <C-\><C-n>
tnoremap fd <C-\><C-n>
" terminal }}}

nnoremap <Leader>ya "ayyggVGy/<C-r>a<CR>
nmap <Leader>s [search]
  nnoremap [search]w yw/<C-r>+<CR>
  nnoremap [search]W yW/<C-r>+<CR>
nmap <Leader>f [fern]
  nnoremap [fern]w :Fern . -reveal=%<CR>
  nnoremap [fern]d :Fern . -reveal=% -drawer<CR>
nnoremap <Leader>w<CR> :w<CR>
nnoremap <Leader>q<CR> :q<CR>
nnoremap <Leader>wq<CR> :wq<CR>

vnoremap < <gv
vnoremap > >gv
xnoremap < <gv
xnoremap > >gv

" Endered !!!
nmap <Leader>o [open]
nnoremap [open]i yaWa<C-c><C-\><C-n>:sleep 100m<CR>agreadlink -f <C-\><C-n>pa<CR><C-\><C-n>:sleep 100m<CR>a<C-\><C-n>4kyy:e <C-r>+<CR>
