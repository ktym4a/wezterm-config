local wezterm = require 'wezterm'

local home_dir = os.getenv("HOME")

local keys = {{
    key = 'd',
    mods = 'CMD',
    action = wezterm.action {
        SplitHorizontal = {
            domain = 'CurrentPaneDomain'
        }
    }
}, {
    key = 'D',
    mods = 'CMD',
    action = wezterm.action {
        SplitVertical = {
            domain = 'CurrentPaneDomain'
        }
    }
}, {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action {
        CloseCurrentPane = {
            confirm = true
        }
    }
}, {
    key = 'h',
    mods = 'CMD',
    action = wezterm.action {
        ActivatePaneDirection = 'Left'
    }
}, {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action {
        ActivatePaneDirection = 'Down'
    }
}, {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action {
        ActivatePaneDirection = 'Up'
    }
}, {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action {
        ActivatePaneDirection = 'Right'
    }
}, {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action {
        ActivatePaneDirection = 'Left'
    }
}, {
    key = 'DownArrow',
    mods = 'CMD',
    action = wezterm.action {
        ActivatePaneDirection = 'Down'
    }
}, {
    key = 'UpArrow',
    mods = 'CMD',
    action = wezterm.action {
        ActivatePaneDirection = 'Up'
    }
}, {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action {
        ActivatePaneDirection = 'Right'
    }
}, {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnCommandInNewTab {
        cwd = home_dir,
        domain = 'DefaultDomain'
    }
}, {
    key = 'n',
    mods = 'CMD',
    action = wezterm.action.SpawnCommandInNewWindow {
        cwd = home_dir,
        domain = 'DefaultDomain'
    }
}}

return keys
