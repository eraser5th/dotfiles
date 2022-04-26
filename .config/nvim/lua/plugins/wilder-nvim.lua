local wilder = require('wilder')
wilder.set_option('use_python_remote_plugin', 0)

wilder.setup({
  modes = {':', '/', '?'},
  next_key = '<Tab>',
  previous_key = '<S-Tab>',
  accept_key = '<Down>',
  reject_key = '<Up>',
})

wilder.set_option('pipeline', {
  wilder.branch(
  wilder.cmdline_pipeline({
    fuzzy = 1,
  }),
  wilder.vim_search_pipeline()
  )
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_palette_theme({
    border = 'rounded',
    ellipsis = '...',
    prompt_position = 'top',
    margin = 'auto',
    highlighter = wilder.basic_highlighter(),
    left = { ' ', wilder.popupmenu_devicons() },
    right = { ' ', wilder.popupmenu_scrollbar() },
    min_width = '50%',
    max_width = '50%',
    min_height = '0',
    max_height = '50%',
    reverse = 0,
  })
))
