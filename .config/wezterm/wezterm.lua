local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'FiraCode Nerd Font'
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.font_size = 14
config.window_background_opacity = 0.7
config.hide_tab_bar_if_only_one_tab = true

config.hyperlink_rules = wezterm.default_hyperlink_rules()


return config
