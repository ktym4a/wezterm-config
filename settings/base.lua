local wezterm = require 'wezterm'

local module = {}

module.font = wezterm.font "MonoLisa Nerd Font"
module.color_scheme = 'Catppuccin Mocha'
module.enable_scroll_bar = false

module.window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20
}


module.window_frame = {
    font = wezterm.font {
        family = 'MonoLisa Nerd Font',
        weight = 'Bold'
    },
    font_size = 11.0,
    active_titlebar_bg = '#181926',
    active_titlebar_fg = '#cdd6f4',
    inactive_titlebar_bg = '#181926',
    inactive_titlebar_fg = '#cdd6f4',
    button_bg = '#181926',
    button_fg = '#cdd6f4'
}

module.inactive_pane_hsb = {
    saturation = 0.7,
    brightness = 0.5
}

return module
