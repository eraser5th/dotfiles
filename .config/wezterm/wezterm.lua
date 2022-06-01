local wezterm = require 'wezterm';
local keys = require 'keys';

local M = {}

wezterm.on("update-right-status", require('updateRightStatus'));

M.use_fancy_tab_bar = false

wezterm.on("format-tab-title", require('formatTabTitle'))

M.colors = {
  tab_bar = {
    background = "#0b0022",
    new_tab = {
      bg_color = "#1b1032",
      fg_color = "#808080",
    },
    new_tab_hover = {
      bg_color = "#3b3052",
      fg_color = "#909090",
      italic = true,
    }
  }
}

M.font = wezterm.font("JetBrainsMono NF")

M.font_size = 13.0

M.color_scheme = "lovelace"

M.native_macos_fullscreen_mode = true

M.window_padding = { left = 8, right = 8, top = 8, bottom = 0 }

M.window_frame = {

}

M.leader = { key="a", mods="CTRL", timeout_milliseconds=1000 }

M.disable_default_key_bindings = true

M.keys = keys

M.window_background_opacity = 0.95

M.automatically_reload_config = false

M.window_background_image = "/Users/katotake/Pictures/wallpapers/twitter_ㄨㄧㄚ(@aaaaaaa068345)_20211101-023710_1455000935634137088_photo.jpg"

M.window_background_image_hsb = { brightness = 0.02, hue = 1.0, saturation = 0.5 }


M.mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak=1, button="Left" }},
    mods="CMD",
    action="OpenLinkAtMouseCursor",
  },
}


return M
