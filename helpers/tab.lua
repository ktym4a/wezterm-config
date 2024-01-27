local wezterm = require 'wezterm'

local function basename(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#313244'
    local background = '#181825'
    local foreground = '#cdd6f4'

    if tab.is_active then
        background = '#a6e3a1'
        foreground = '#11111b'
    elseif hover then
        background = '#94e2d5'
        foreground = '#11111b'
    end

    local edge_foreground = background

    local nerd_icons = {
        nvim = wezterm.nerdfonts.custom_vim,
        vim = wezterm.nerdfonts.custom_vim,
        bash = wezterm.nerdfonts.dev_terminal,
        zsh = wezterm.nerdfonts.dev_terminal,
        ssh = wezterm.nerdfonts.mdi_server,
        top = wezterm.nerdfonts.mdi_monitor,
        docker = wezterm.nerdfonts.dev_docker,
        node = wezterm.nerdfonts.dev_nodejs_small
    }
    local zoomed = ""
    if tab.active_pane.is_zoomed then
        zoomed = "[Z] "
    end

    local pane = tab.active_pane
    local process_name = basename(pane.foreground_process_name)
    local domain_name = pane.domain_name

    local cwd = basename(pane.current_working_dir)

    if domain_name ~= "local" or process_name == "ssh" then
        process_name = 'ssh'

        if domain_name ~= "local" then
            cwd = domain_name
        end

        background = '#f2cdcd'
        foreground = '#11111b'

        if tab.is_active then
            background = '#f5c2e7'
        elseif hover then
            background = '#fab387'
        end
    end

    local icon = nerd_icons[process_name]
    local index = tab.tab_index + 1

    local title = index .. ": " .. cwd
    if icon ~= nil then
        title = icon .. "  " .. zoomed .. title
    end
    return {{
        Background = {
            Color = edge_background
        }
    }, {
        Foreground = {
            Color = edge_foreground
        }
    }, {
        Background = {
            Color = background
        }
    }, {
        Foreground = {
            Color = foreground
        }
    }, {
        Background = {
            Color = background
        }
    }, {
        Foreground = {
            Color = foreground
        }
    }, {
        Text = " " .. title .. " "
    }}
end)
