local colors = require('plugins.layout.galaxyline.colors')
local M = {}

M.get_git_status_color = function ()
  local color = colors.green

  local res = vim.fn.system(
    "git -C '" .. vim.fn.getcwd() .. "' status --porcelain"
  )

  for _, file in next, vim.fn.split(res, "\n") do
    local status = string.sub(file, 1, 2)
    local function statusIs(stutList)
      for _, stut in next, stutList do
        if status == stut then
          return true
        end
      end
      return false
    end

    if statusIs({" M", "??", "A", " D", "AD"}) then
      color = colors.red
    end

    if color ~= colors.red then
      if statusIs({"M ", "A ", "D ", "UU", "AA"}) then
        color = colors.yellow
      end
    end
  end

  return color
end

return M
