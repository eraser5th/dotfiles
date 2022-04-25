call wilder#setup({
  \ 'modes': [':', '/', '?'],
  \ 'next_key': '<Tab>',
  \ 'previous_key': '<S-Tab>',
  \ 'accept_key': '<Down>',
  \ 'reject_key': '<Up>',
\ })

call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'min_width': '20%',
      \ 'max_height': '40%',
      \ 'border': 'rounded',
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
        \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
        \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
  \ })))
