local Hydra = require('hydra')

Hydra({
   name = 'Side scroll',
   mode = 'n',
   body = 'z',
   heads = {
      { 'h', '5zh' },
      { 'l', '5zl', { desc = '←/→' } },
      { 'H', 'zH' },
      { 'L', 'zL', { desc = 'half screen ←/→' } },
   }
})

local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end

local telescope_hint = [[
  _f_: files       _m_: marks
  _o_: old files   _g_: live grep
  _p_: projects    _/_: search in file
 
  _h_: vim help    _c_: execute command
  _k_: keymap      _;_: commands history
  _r_: registers   _?_: search history

  _<Enter>_: Telescope           _<Esc>_ 
]]

Hydra({
   name = 'Telescope',
   hint = telescope_hint,
   config = {
      color = 'teal',
      invoke_on_body = true,
      hint = {
         position = 'middle',
         border = 'rounded',
      },
   },
   mode = 'n',
   body = '<Leader>f',
   heads = {
      { 'f', cmd 'Telescope find_files' },
      { 'g', cmd 'Telescope live_grep' },
      { 'h', cmd 'Telescope help_tags', { desc = 'Vim help' } },
      { 'o', cmd 'Telescope oldfiles', { desc = 'Recently opened files' } },
      { 'm', cmd 'MarksListBuf', { desc = 'Marks' } },
      { 'k', cmd 'Telescope keymaps' },
      { 'r', cmd 'Telescope registers' },
      { 'p', cmd 'Telescope projects', { desc = 'Projects' } },
      { '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'Search in file' } },
      { '?', cmd 'Telescope search_history',  { desc = 'Search history' } },
      { ';', cmd 'Telescope command_history', { desc = 'Command-line history' } },
      { 'c', cmd 'Telescope commands', { desc = 'Execute command' } },
      { '<Enter>', cmd 'Telescope', { exit = true, desc = 'List all pickers' } },
      { '<Esc>', nil, { exit = true, nowait = true } },
   }
})

local window_hint = [[
 ^ ^    _k_                        _K_
 ^ ^  _h_   _l_ : move window      _H_   _L_ : resize window
 ^ ^    _j_                        _J_
 ^
 ^     _s_   : split holizontal   _v_   : split vertical     ^
 ^     _c_   : close window
 ^
 ^  _<Enter>_: write file         _q_   : exit               ^
]]

Hydra({
   name = 'Window',
   hint = window_hint,
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         position = 'middle',
         border = 'rounded',
      },
   },
   mode = 'n',
   body = '<Leader>ww',
   heads = {
      { 'h', '<C-w>h' },
      { 'j', '<C-w>j' },
      { 'k', '<C-w>k' },
      { 'l', '<C-w>l' },
      { 'v', '<C-w>v' },
      { 's', '<C-w>s' },
      { 'c', '<C-w>c' },
      { 'H', '3<C-w><' },
      { 'J', '3<C-w>+' },
      { 'K', '3<C-w>-' },
      { 'L', '3<C-w>>' },
      { '<Enter>', 'w', { exit = true } },
      { 'q', nil, { exit = true, nowait = true } },
   }
})

