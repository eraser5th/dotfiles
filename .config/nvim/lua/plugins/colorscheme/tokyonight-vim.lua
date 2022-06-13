local vim = vim

vim.opt.termguicolors = true

-- Available vlues: 'night', 'storm'
vim.g.tokyonight_style = 'night'

vim.g.tokyonight_transparent_background = false

-- Available values: 'green', 'red', 'blue'
vim.g.tokyonight_menu_selection_background = 'green'

vim.g.tokyonight_enable_italic = 0

vim.g.tokyonight_disable_italic_comment = 1

-- Available values: 'auto', 'red', 'green', 'blue'
vim.g.tokyonight_cursor = 'auto'

-- Available values: 'bold', 'underline', 'italic', 'grey background'
vim.g.tokyonight_current_word = 'grey background'

-- colorscheme tokyonight
vim.g.lightline = { colorscheme = 'tokyonight' }
