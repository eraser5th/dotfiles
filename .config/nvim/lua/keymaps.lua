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
  -- { 'n', 'j', 'gj' },
  -- { 'n', 'k', 'gk' },
  -- { 'v', 'j', 'gj' },
  -- { 'v', 'k', 'gk' },
  { 'n', '+', '<C-a>' },
  { 'n', '-', '<C-x>' },
  { 'n', '<C-a>', '<Nop>' },
  { 'n', '<C-x>', '<Nop>' },
  { 'n', 'Y', 'y$' },
  { 'n', 'x', '"_x' },
  -- { 'n', leader .. 'j', '7j' },
  -- { 'n', leader .. 'k', '7k' },
  { 'n', leader .. 'ya', '"ayyggVGy/<C-r>a<CR>' },

  -- visual move
  -- vim.cmd([[
    -- nmap <Leader>j gj<SID><Leader>
    -- nmap <Leader>k gk<SID><Leader>
    -- nnoremap <script> <SID>gj gj<SID><Leader>
    -- nnoremap <script> <SID>gk gk<SID><Leader>
    -- nmap <SID><Leader> <Nop>
    -- vmap gj gj<SID><Leader>
    -- vmap gk gk<SID><Leader>
    -- vnoremap <script> <SID>gj gj<SID><Leader>
    -- vnoremap <script> <SID>gk gk<SID><Leader>
    -- vmap <SID><Leader> <Nop>
  -- ]])

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
    -- resize
    -- vim.cmd([[
      -- nmap <C-w>+ <C-w>+<SID>ws
      -- nmap <C-w>- <C-w>-<SID>ws
      -- nmap <C-w>> <C-w>><SID>ws
      -- nmap <C-w>< <C-w><<SID>ws
      -- nnoremap <script> <SID>ws+ <C-w>+<SID>ws
      -- nnoremap <script> <SID>ws- <C-w>-<SID>ws
      -- nnoremap <script> <SID>ws> <C-w>><SID>ws
      -- nnoremap <script> <SID>ws< <C-w><<SID>ws
      -- nmap <SID>ws <Nop>
    -- ]])

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

