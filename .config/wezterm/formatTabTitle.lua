local wezterm = require 'wezterm';
local icons = require 'icons';

return function(tab, _, _, _, hover, max_width)
  local edge_background = "#0b0022"
  local background = "#1b1032"
  local foreground = "#808080"

  if tab.is_active then
    background = "#2b2042"
    foreground = "#c0c0c0"
  elseif hover then
    background = "#3b3052"
    foreground = "#909090"
  end

  local edge_foreground = background

  local title = wezterm.truncate_right(
    " "
      .. tab.tab_index + 1
      .. " "
      .. tab.active_pane.title
      .. " ",
    max_width-2
  )

  return {
    {Background={Color=edge_background}},
    {Foreground={Color=edge_foreground}},
    {Text=icons.SOLID_LEFT_HALF_CIRCLE},
    {Background={Color=background}},
    {Foreground={Color=foreground}},
    {Text=title},
    {Background={Color=edge_background}},
    {Foreground={Color=edge_foreground}},
    {Text=icons.SOLID_RIGHT_HALF_CIRCLE},
  }
end
