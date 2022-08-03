local wezterm = require('wezterm');

local function str_split(str, sep)
  local result = {}
  for match in (str .. sep):gmatch("(.-)" .. sep) do
    result[#result + 1] = match
  end
  return result
end

local function get_branch_name(cwd)
  local status_success, status, status_error = wezterm.run_child_process({ 'git', '-C', cwd, 'status', '-s' })
  local branch_success, branch, branch_error = wezterm.run_child_process({ 'git', '-C', cwd, 'branch' })

  for _, line in ipairs(str_split(branch, '\n')) do
    if line:find('*') then
      return line:sub(2)
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
