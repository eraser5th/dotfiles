local vim = vim
local util = require('util')

local vim_modules = {
  'lib/commands.vim',
  'options/isKeyword.vim',
}

local lua_modules = {
  'keymaps',
  'set',
  'neovide',
  'plugins',
}

local M = {
  setup = function()
    vim.g.root_path = '$HOME/.config/nvim'
    vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
    vim.g.python_host_prog = '/usr/bin/python2'

    util.forEach(vim_modules, function(module, _)
      util.source(vim.g.root_path .. '/' .. module)
    end)

    util.forEach(lua_modules, function(module, _)
      require(module)
    end)
  end
}

return M
