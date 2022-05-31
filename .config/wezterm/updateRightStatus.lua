local wezterm = require 'wezterm';
local util = require 'util';

local BATTERY_0 = utf8.char(0xf244)
local BATTERY_1 = utf8.char(0xf243)
local BATTERY_2 = utf8.char(0xf242)
local BATTERY_3 = utf8.char(0xf241)
local BATTERY_4 = utf8.char(0xf240)
local CLOCK = utf8.char(0xf64f)
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

return function(window, pane)
  local cells = {};

  -- working dir info
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    -- delete 'file: //'
    cwd_uri = cwd_uri:sub(8);
    table.insert(cells, cwd_uri);
  end

  -- date info
  local date = wezterm.strftime("%a %b %-d %H:%M:%S");
  table.insert(cells, CLOCK .. " " .. date);

  -- battery info
  local state_of_charge = wezterm.battery_info()[1].state_of_charge * 100

  local BATTERY = ""

  if state_of_charge <= 10 then
    BATTERY = BATTERY_0
  elseif state_of_charge <= 25 then
    BATTERY = BATTERY_1
  elseif state_of_charge <= 50 then
    BATTERY = BATTERY_2
  elseif state_of_charge <= 75 then
    BATTERY = BATTERY_3
  else
    BATTERY = BATTERY_4
  end

  table.insert(cells, BATTERY .. string.format("  %.0f%%", state_of_charge))


  local colors = {
    "#3c1361",
    "#52307c",
    "#663a82",
    "#7c5295",
    "#b491c8",
  };

  local text_fg = "#c0c0c0";

  local elements = {};
  local num_cells = 0;

  local function push(text, _)
    local cell_no = num_cells + 1
    table.insert(elements, {Foreground={Color=colors[cell_no]}})
    table.insert(elements, {Text=SOLID_LEFT_ARROW})
    table.insert(elements, {Foreground={Color=text_fg}})
    table.insert(elements, {Background={Color=colors[cell_no]}})
    table.insert(elements, {Text=" "..text.." "})
    num_cells = num_cells + 1
  end

  util.forEach(cells, push)

  window:set_right_status(wezterm.format(elements));
end
