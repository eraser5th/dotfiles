let g:translator_target_lang = 'jp'

""" Configuration example
" Echo translation in the cmdline
nmap <Leader>x [transrate]
vmap <Leader>x [transrate]
  nmap [transrate] <Plug>Translate
  vmap [transrate] <Plug>TranslateV
  " Display translation in a window
  nmap [transrate]w <Plug>TranslateW
  vmap [transrate]w <Plug>TranslateWV
  " Replace the text with translation
  nmap [transrate]r <Plug>TranslateR
  vmap [transrate]r <Plug>TranslateRV
  " Translate the text in clipboard
  nmap [transrate]x <Plug>TranslateX
