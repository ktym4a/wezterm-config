local wezterm = require 'wezterm'

-- get git branch name and git user name from git commnad
local function get_git_branch(cwd_uri)
    local success, stdout, stderr = wezterm.run_child_process {'git', '-C', cwd_uri, 'branch', '--show-current'}
    -- get git user name
    local success2, stdout2, stderr2 = wezterm.run_child_process {'git', '-C', cwd_uri, 'config', 'user.name'}

    if success and success2 then
        local branch = stdout:sub(1, -2)
        local user = stdout2:sub(1, -2)
        return wezterm.nerdfonts.mdi_source_branch .. ' ' .. branch .. '/' .. user
    end
end

-- /Users/username/ -> ~
local function shorten_home_dir(cwd_uri)
    local home_dir = os.getenv("HOME")
    if cwd_uri:find(home_dir) then
        cwd_uri = cwd_uri:gsub(home_dir, "~")
    end
    return cwd_uri
end

wezterm.on("update-right-status", function(window, pane)
    local cells = {};
    local overrides = {}

    local cwd_uri = pane:get_current_working_dir()
    if cwd_uri then
        cwd_uri = cwd_uri:sub(8);
        local slash = cwd_uri:find("/")
        local cwd = ""
        local gitBranch = ""
        local gitUser = ""


        if slash then
            cwd = cwd_uri:sub(slash)
            cwd = shorten_home_dir(cwd_uri)
            gitBranch = get_git_branch(cwd_uri)

            table.insert(cells, cwd);

            if gitBranch then
                table.insert(cells, gitBranch);
            end
        end
    end

    local date = wezterm.strftime("%H:%M %a");
    table.insert(cells, date);

    for _, b in ipairs(wezterm.battery_info()) do
        table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
    end

    local SOLID_LEFT_ARROW = utf8.char(0xe0b6)

    local colors = {"#D5E4FF", "#C4D2FF", "#B4BEFE", "#8992C4", "#747CA6"};

    local text_fg = "#11111b";

    local elements = {};
    local num_cells = 0;

    function push(text, is_last)
        local cell_no = num_cells + 1
        table.insert(elements, {
            Foreground = {
                Color = colors[cell_no]
            }
        })
        table.insert(elements, {
            Text = SOLID_LEFT_ARROW
        })
        table.insert(elements, {
            Foreground = {
                Color = text_fg
            }
        })
        table.insert(elements, {
            Background = {
                Color = colors[cell_no]
            }
        })
        table.insert(elements, {
            Text = " " .. text .. " "
        })
        if not is_last then
        end
        num_cells = num_cells + 1
    end

    while #cells > 0 do
        local cell = table.remove(cells, 1)
        push(cell, #cells == 0)
    end

    window:set_right_status(wezterm.format(elements));
end);
