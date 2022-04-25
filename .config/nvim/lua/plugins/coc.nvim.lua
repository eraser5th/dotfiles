local util = require('util')
local vim = vim
local set = vim.opt

local keyMappings = {
  { 'n', 'gd', '<Plug>(coc-definition)', { remap = true } },
  { 'n', 'gi', '<Plug>(coc-implementation)', { remap = true } },
  { 'n', 'gr', '<Plug>(coc-references)', { remap = true } },
  { 'n', 'K',  ':call CocAction("doHover")<CR>' },
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
