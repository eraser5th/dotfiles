local wilder = require('wilder')
wilder.set_option('use_python_remote_plugin', 0)

local gradient = {
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end

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
    highlights = {
      gradient = gradient, -- must be set
      -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
    },
    highlighter = wilder.highlighter_with_gradient({
      wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
    }),
    left = { ' ', wilder.popupmenu_devicons() },
    right = { ' ', wilder.popupmenu_scrollbar() },
    min_width = '50%',
    max_width = '50%',
    min_height = '0',
    max_height = '50%',
    reverse = 0,
  })
))
