local colors = require('lua/rose-pine').colors()
local wezterm = require('wezterm')

local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  audible_bell = 'Disabled',
  colors = colors,
  enable_tab_bar = false,
  font = wezterm.font 'FantasqueSansMono Nerd Font',
  font_size = 13,
  window_close_confirmation = 'NeverPrompt',
}
