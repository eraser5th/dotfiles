augroup vimrc
  autocmd!
augroup END

command! -nargs=* AutoCmd autocmd vimrc <args>

function! s:my_source(dir_path, file_name) abort
  let l:file_path = expand(a:dir_path . '/' . a:file_name)
  execute 'source' l:file_path
endfunction

command! -nargs=1 -complete=dir Source call <SID>my_source(g:root_path, <args>)

" https://cohama.hateblo.jp/entry/2013/08/11/020849
function! s:get_syntax_id(transparent)
  let synid = synID(line('.'), col('.'), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction

function! s:get_syntax_attr(synid)
  let name = synIDattr(a:synid, 'name')
  let ctermfg = synIDattr(a:synid, 'fg', 'cterm')
  let ctermbg = synIDattr(a:synid, 'bg', 'cterm')
  let guifg = synIDattr(a:synid, 'fg', 'gui')
  let guibg = synIDattr(a:synid, 'bg', 'gui')
  return {
        \ 'name': name,
        \ 'ctermfg': ctermfg,
        \ 'ctermbg': ctermbg,
        \ 'guifg': guifg,
        \ 'guibg': guibg}
endfunction

function! s:get_syntax_info()
  let baseSyn = s:get_syntax_attr(s:get_syntax_id(0))
  echo 'name: ' . baseSyn.name .
        \ ' ctermfg: ' . baseSyn.ctermfg .
        \ ' ctermbg: ' . baseSyn.ctermbg .
        \ ' guifg: ' . baseSyn.guifg .
        \ ' guibg: ' . baseSyn.guibg
  let linkedSyn = s:get_syntax_attr(s:get_syntax_id(1))
  echo 'link to'
  echo 'name: ' . linkedSyn.name .
        \ ' ctermfg: ' . linkedSyn.ctermfg .
        \ ' ctermbg: ' . linkedSyn.ctermbg .
        \ ' guifg: ' . linkedSyn.guifg .
        \ ' guibg: ' . linkedSyn.guibg
endfunction

command! SyntaxInfo call s:get_syntax_info()

nnoremap s :SyntaxInfo<CR>
