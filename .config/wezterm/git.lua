local wezterm = require('wezterm');

local function get_branch_name()
  for line in io.popen("git branch"):lines() do
    local m = line:match("%* (.+)$")
    if m then
      return m
    end
  end

  return "git is not working here"
end

local function get_status()
end

return {
  get_branch_name = get_branch_name,
  get_status = get_status
}
