nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set pumblend=20
set winblend=20

let g:coc_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

let g:coc_border_joinchars = ['─', '│', '─', '│']

let g:coc_config_home = '$HOME/dotfiles/vim/vim-nvim-easy-setting/coc-setting.json'

nmap <silent> <Leader><Leader>j <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader><Leader>k <Plug>(coc-diagnostic-prev-error)
nmap <silent> gd<CR> <Plug>(coc-definition)
nmap <silent> gdv <C-w>v<C-w>l<Plug>(coc-definition)
nmap <silent> gds <C-w>s<C-w>j<Plug>(coc-definition)
