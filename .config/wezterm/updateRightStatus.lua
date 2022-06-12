local wezterm = require 'wezterm';
local util = require 'util';
local git = require 'git';
local icons = require('icons')

local function create_cwd_cell(pane)
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    return cwd_uri:sub(8);
  end
  return "cannot get cwd uri"
end

local function create_date_cell()
  return icons.CLOCK .. wezterm.strftime(" %a %b %-d %H:%M:%S");
end

local function create_battery_cell()
  local battery_info = wezterm.battery_info()[1]
  local battery_percentage = battery_info.state_of_charge * 100
  local is_charging = battery_info.state == 'Charging'
  local BATTERY = icons.fn.BATTERY(
    battery_percentage,
    is_charging
  )
  return BATTERY .. string.format(" %.0f%%", battery_percentage)
end

local function create_branch_cell()
  return icons.GIT_BRANCH .. ' ' .. git.get_branch_name()
end

local function create_element(cell, fg_color, bg_color)
  return {
    {Foreground={Color=bg_color}},
    {Text=icons.SOLID_LEFT_ARROW},
    {Foreground={Color=fg_color}},
    {Background={Color=bg_color}},
    {Text=" " .. cell .. " "},
  }
end

return function(window, pane)

  local text_fg = "#c0c0c0";
  local bg_colors = {
    "#3c1361",
    "#52307c",
    "#663a82",
    "#7c5295",
    "#b491c8",
  };

  local cells = {
    create_cwd_cell(pane),
    create_date_cell(),
    create_battery_cell(),
    create_branch_cell(),
  }

  local elements = util.map(cells, function(cell, i)
    return create_element(cell, text_fg, bg_colors[i])
  end)

  window:set_right_status(wezterm.format(
    util.flat(elements)
  ));
end
