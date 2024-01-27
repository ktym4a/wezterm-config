local wezterm = require 'wezterm'

require 'helpers.tab'
require 'helpers.status'

local colors = require 'settings.colors'
local base = require 'settings.base'
local keymaps = require 'settings.keymaps'

local config = {}

config.font = base.font
config.color_scheme = base.color_scheme
config.enable_scroll_bar = base.enable_scroll_bar

config.window_frame = base.window_frame

config.window_padding = base.window_padding

config.colors = colors

config.inactive_pane_hsb = base.inactive_pane_hsb

config.keys = keymaps

return config
