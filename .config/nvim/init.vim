let g:root_path = '$HOME/dotfiles/.config/nvim'

let g:python3_host_prog = '/opt/homebrew/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

execute 'source ' . g:root_path . '/lib/commands.vim'

Source 'options/set.vim'
Source 'options/isKeyword.vim'
Source 'dein.vim'
Source 'neovide.vim'
Source 'keymaps/keymaps.vim'

" lua require('my_lua_modules.plugins')
