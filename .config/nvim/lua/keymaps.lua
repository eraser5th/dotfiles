local util = require('util')
local vim = vim

local leader = '<Leader>'
local window = '[window]'
local resize = '[Resize]'
local tab = '[Tab]'

vim.g.mapleader = ' '

-- These keymaps are plugin-independent
local keymaps = {
  -- { 'mode', 'lhs', 'rhs' | rhs , options }
  -- misc
  { 'i', 'kj', '<Esc>' },
  { 'i', 'fd', '<Esc>' },
  { 'i', 'jj', '<Esc>' },
  { 'n', '<Esc><Esc>', ':noh<CR><Esc>' },
  { 'n', '+', '<C-a>' },
  { 'n', '-', '<C-x>' },
  { 'n', '<C-a>', '<Nop>' },
  { 'n', '<C-x>', '<Nop>' },
  { 'n', 'Y', 'y$' },
  { 'n', 'x', '"_x' },
  { 'n', leader .. 'ya', '"ayyggVGy/<C-r>a<CR>' },

  -- window
  { 'n', leader .. 'w', window, { remap = true } },
    { 'n', window, leader .. 'w' },
    { 'n', window .. 's', '<C-w>s' },
    { 'n', window .. 'v', '<C-w>v' },
    { 'n', window .. 'w', '<C-w>w' },
    { 'n', window .. 'r', '<C-w>r' },
    { 'n', window .. 'h', '<C-w>h' },
    { 'n', window .. 'j', '<C-w>j' },
    { 'n', window .. 'k', '<C-w>k' },
    { 'n', window .. 'l', '<C-w>l' },

  { 'n', leader .. 'r', resize, { remap = true } },
    { 'n', resize, 	  leader .. 'r' },
    { 'n', resize .. 'h', '<C-w>H' },
    { 'n', resize .. 'j', '<C-w>J' },
    { 'n', resize .. 'k', '<C-w>K' },
    { 'n', resize .. 'l', '<C-w>L' },

  -- tab
  { 'n', leader .. 't', tab, { remap = true } },
    { 'n', tab,        leader .. 't' },
    { 'n', tab .. 'h', 'gT' },
    { 'n', tab .. 'l', 'gt' },
    { 'n', tab .. 'H', ':+tabmove<CR>' },
    { 'n', tab .. 'L', ':-tabmove<CR>' },
    { 'n', tab .. 'd', ':tabclose<CR>' },
    { 'n', tab .. 'n', ':tabnew<CR>' },
    { 'n', tab .. 'L', ':-tabmove<CR>' },

  -- terminal
  { 'n', leader .. "'", ':terminal<CR>' },
  { 't', 'kj', '<C-\\><C-n>' },

  -- save and quit
  { 'n', leader .. 'w<CR>', ':w<CR>' },
  { 'n', leader .. 'q<CR>', ':q<CR>' },

  -- indent
  { 'v', '<', '<gv' },
  { 'v', '>', '>gv' },
  { 'x', '<', '<gv' },
  { 'x', '>', '>gv' },
}

util.forEach(keymaps, function(keymap)
  util.setKeymap(keymap)
end)

