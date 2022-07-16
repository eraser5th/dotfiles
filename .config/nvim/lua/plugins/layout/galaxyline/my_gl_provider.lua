local colors = require('plugins.layout.galaxyline.colors')
local M = {}

local function mode2color(mode)
  local mode_colors = {
    n = colors.green,
    i = colors.syan,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
    t = colors.orange,
  }
  return mode_colors[mode] or colors.red
end

local function mode2alias(mode)
  local alias = {
    n      = 'NORMAL',
    i      = 'INSERT',
    c      = 'COMMAND',
    V      = 'VISUAL',
    [''] = 'VISUAL',
    v      = 'VISUAL',
    R      = 'REPLACE',
    t      = 'TERMINAL',
  }
  return alias[mode] or mode
end

M.ViMode_provider = function()
  vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode2color(vim.fn.mode()))
  vim.api.nvim_command(
    'hi ViModeSeparator'
      .. ' guifg=' .. mode2color(vim.fn.mode())
      .. ' guibg=' .. colors.bg
  )
  return "  " .. mode2alias(vim.fn.mode()) .. " "
end

return M
