
-- https://wezfurlong.org/wezterm/config/files.htm

local wezterm = require 'wezterm'

local config = {
	check_for_updates = false
}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
	config.font_size = 18.0
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|TITLE"
	config.show_tabs_in_tab_bar = true
	config.use_fancy_tab_bar = true
	config.show_new_tab_button_in_tab_bar = true
	config.enable_tab_bar = true
else
	config.font_size = 22.0
	config.window_decorations = "NONE"
end


return config
