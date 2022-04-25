local vim = vim

local M = {}

function M.forEach(target, callback)
  for key, value in pairs(target) do
    callback(value, key)
  end
end

function M.source(path)
  vim.api.nvim_command('source ' .. path)
end

---@class Keymap
---@field ['1'] '' | 'n' | 'i' | 'v' | 'x' | 's' | 'o'
---@field ['2'] string
---@field ['3'] string | function
---@field ['4'] table

---@param keymap Keymap
function M.setKeymap(keymap)
  vim.keymap.set(keymap[1], keymap[2], keymap[3], keymap[4])
end

return M
