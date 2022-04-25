let g:translate_source = 'en'
let g:translate_target = 'ja'
let g:translate_popup_window = 0 " if you want use popup window, set value 1
let g:translate_winsize = 10 " set buffer window height size if you doesn't use popup window

nmap <Leader><Leader>t <Plug>(Translate)
vmap <Leader><Leader>t <Plug>(VTranslate)
