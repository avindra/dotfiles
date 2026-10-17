--[[
    This config was ported to lua with the help of hyprconf2lua v1.8.1
    see: https://github.com/Prateek-squadron/hyprconf2lua
--]]

---@module 'hl'

local monitors = require("monitors")

--##################
--## MY PROGRAMS ###
--##################

local terminal = "kitty"
-- local fileManager = "pcmanfm-qt"

--$menu = wofi --show drun
local menu = "rofi -show combi 'run,window'"
--$browser = google-chrome-unstable
local browser = "firefox"

--############################
--## ENVIRONMENT VARIABLES ###
--############################

-- see https://wiki.hypr.land/configuring/core/environment-variables/

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

-- https://github.com/Admicos/minecraft-wayland/issues/55#issuecomment-1862200380

hl.env("__GL_THREADED_OPTIMIZATIONS", 0)

--####################
--## LOOK AND FEEL ###
--####################

-- see: https://wiki.hypr.land/configuring/core/config-options/

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 10,
        border_size = 3,
        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = foreground,
            inactive_border = background,
        },
    },
})


hl.config({
		-- https://wiki.hypr.land/configuring/core/config-options/#decoration
    decoration = {
        rounding = 5,
        rounding_power = 1,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,
				-- https://wiki.hypr.land/configuring/core/config-options/#blur
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})

-- https://wiki.hypr.land/configuring/core/animations/
-- https://wiki.hypr.land/hypr-ecosystem/user/hyprlock/#animations

hl.config({
    animations = {
        enabled = true,
        -- Default animations, for more see https://wiki.hypr.land/configuring/core/animations/
    },
})
hl.curve("myBezier", {
    type = "bezier",
    points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- see: https://wiki.hypr.land/configuring/layouts/dwindle-layout/

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- see: https://wiki.hypr.land/configuring/layouts/master-layout/

hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hypr.land/configuring/core/config-options/#misc
hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

-- @see https://wiki.hypr.land/configuring/code-snippets/#smart-gaps

hl.workspace_rule({
    workspace = "w[t1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = "w[tg1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = "f[1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.window_rule({
    name  = "border_size_0_141",
    match = {
        float = 0,
        workspace = "w[tv1]",
    },
    border_size = 0,
})

hl.window_rule({
    name  = "rounding_0_142",
    match = {
        float = 0,
        workspace = "w[tv1]",
    },
    rounding = 0,
})

hl.window_rule({
    name  = "border_size_0_143",
    match = {
        float = 0,
        workspace = "f[1]",
    },
    border_size = 0,
})

hl.window_rule({
    name  = "rounding_0_144",
    match = {
        float = 0,
        workspace = "f[1]",
    },
    rounding = 0,
})

--############
--## INPUT ###
--############

-- https://wiki.hypr.land/configuring/core/config-options/#input

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },
})


-- Example per-device config
-- see https://wiki.hypr.land/configuring/core/devices/

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

--##################
--## KEYBINDINGS ###
--##################

local mod = "SUPER"

-- see https://wiki.hypr.land/configuring/core/binds/

hl.bind(mod .. " + " .. "Return", hl.dsp.exec_cmd("kitty -e fish"))
hl.bind(mod .. " + SHIFT + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("CONTROL + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty -e htop"))

hl.bind(mod .. " + " .. "Q", hl.dsp.window.close())
hl.bind(mod .. " + " .. "M", hl.dsp.exit())

hl.bind(mod .. " + " .. "C", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + " .. "R", hl.dsp.window.float())
hl.bind(mod .. " + " .. "W", hl.dsp.group.toggle())

hl.bind("F12", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind("Print", hl.dsp.exec_cmd("screenshot"))

local sink = "@DEFAULT_SINK@"

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

hl.bind(mod .. " + " .. "D", hl.dsp.exec_cmd("rofi -show combi 'run,window'"))
hl.bind(mod .. " + " .. "P", hl.dsp.window.pseudo())

-- dwindle

hl.bind(mod .. " + " .. "e", hl.dsp.layout("togglesplit"))

-- dwindle

hl.bind(mod .. " + " .. "F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + " .. "X", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod .. " + " .. "SHIFT + X", hl.dsp.dpms())
hl.bind(mod .. " + " .. "Grave", hl.dsp.focus({ workspace = "previous" }))

-- Move focus in group

hl.bind(mod .. " + " .. "CONTROL" .. " + " .. "left", hl.dsp.group.next({ forward = false }))
hl.bind(mod .. " + " .. "CONTROL" .. " + " .. "right", hl.dsp.group.next())

-- Move focus with mod + arrow keys

hl.bind(mod .. " + " .. "h", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + " .. "l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + " .. "j", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + " .. "k", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. "H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. "L", hl.dsp.window.move({ direction = "right" }))

-- Switch workspaces with mod + [0-9]

hl.bind(mod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mod + SHIFT + [0-9]

hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad)

hl.bind(mod .. " + " .. "S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mod + scroll

hl.bind(mod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB and dragging

hl.bind(mod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

--#############################
--#  WINDOWS AND WORKSPACES  ##
--#############################

-- See https://wiki.hypr.land/configuring/core/rules/workspace-rules/

local monLeft = "DP-3"
local monMid = "HDMI-A-1"
local monRight = "DP-2"

hl.workspace_rule({
    workspace = 1,
    monitor = monLeft,
})

hl.workspace_rule({
    workspace = 2,
    monitor = monLeft,
})

hl.workspace_rule({
    workspace = 3,
    monitor = monLeft,
})

hl.workspace_rule({
    workspace = 4,
		monitor = monMid,
})

hl.workspace_rule({
    workspace = 5,
		monitor = monMid,
})

hl.workspace_rule({
    workspace = 6,
		monitor = monMid,
})

hl.workspace_rule({
    workspace = 7,
		monitor = monRight,
})

hl.workspace_rule({
    workspace = 8,
		monitor = monRight,
})

hl.workspace_rule({
    workspace = 9,
		monitor = monRight,
})

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper")
    hl.exec_cmd("setbg")
    hl.exec_cmd("localstartup")
end)
