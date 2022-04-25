local vim = vim
local util = require('util')

local modules = {
  'lib/commands.vim',
  'options/set.vim',
  'options/isKeyword.vim',
  'dein.vim',
  'neovide.vim',
  -- 'keymaps/keymaps.vim',
}

local M = {
  setup = function()
    vim.g.root_path = '$HOME/.config/nvim'
    vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
    vim.g.python_host_prog = '/usr/bin/python2'

    require('keymaps')

    util.forEach(modules, function(module, _)
      util.source(vim.g.root_path .. '/' .. module)
    end)
  end
}

return M
