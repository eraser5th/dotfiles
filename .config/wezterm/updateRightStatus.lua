local wezterm = require 'wezterm';
local util = require 'util';
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

local function create_elements_by_cells(cells)
  local text_fg = "#c0c0c0";
  local colors = {
    "#3c1361",
    "#52307c",
    "#663a82",
    "#7c5295",
    "#b491c8",
  };

  local elements = {};

  local function push(text, i)
    table.insert(elements, {Foreground={Color=colors[i]}})
    table.insert(elements, {Text=icons.SOLID_LEFT_ARROW})
    table.insert(elements, {Foreground={Color=text_fg}})
    table.insert(elements, {Background={Color=colors[i]}})
    table.insert(elements, {Text=" "..text.." "})
  end

  util.forEach(cells, push)

  return elements
end

return function(window, pane)
  local elements = create_elements_by_cells({
    create_cwd_cell(pane),
    create_date_cell(),
    create_battery_cell(),
  })

  window:set_right_status(wezterm.format(elements));
end
