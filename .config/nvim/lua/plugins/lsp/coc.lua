local util = require('util')
local vim = vim
local set = vim.opt

print('this file is loaded')

local keyMappings = {
  { 'n', 'gd', '<Plug>(coc-definition)', { remap = true } },
  { 'n', 'gi', '<Plug>(coc-implementation)', { remap = true } },
  { 'n', 'gr', '<Plug>(coc-references)', { remap = true } },
}

util.forEach(
  keyMappings,
  function(mapping) util.setKeymap(mapping) end
)

set.pumblend = 20
set.winblend = 20

vim.g.coc_borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }

vim.g.coc_border_joinchars = { '─', '│', '─', '│' }

vim.g.coc_config_home = '$HOME/.config/nvim/coc-setting.json'

vim.g.coc_global_extensions = {
  '@yaegassy/coc-volar',
  'coc-css',
  'coc-docker',
  'coc-eslint',
  'coc-git',
  'coc-html',
  'coc-json',
  'coc-lua',
  'coc-markdownlint',
  'coc-phpls',
  'coc-prettier',
  'coc-sql',
  'coc-sumneko-lua',
  'coc-toml',
  'coc-tsserver',
  'coc-vimlsp',
  'coc-jedi',
  'coc-diagnostic',
}

--   inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm()
                              -- \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
-- nmap <silent> gd <Plug>(coc-definition)
-- nmap <silent> <C-w>gd <cmd>vs<cr><Plug>(coc-definition)
-- nmap <silent> gy <Plug>(coc-type-definition)
-- nmap <silent> gi <Plug>(coc-implementation)
-- nmap <silent> gF <Plug>(coc-references)
-- nmap <f2> <Plug>(coc-rename)
-- nmap <silent> [g <Plug>(coc-diagnostic-prev)
-- nmap <silent> ]g <Plug>(coc-diagnostic-next)
-- nmap <esc><esc> <cmd>call coc#float#close_all()<cr>
-- " Find symbol of current document.
-- nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
-- " Search workspace symbols.
-- nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
vim.cmd([[
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" higlight when hover cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
]])
