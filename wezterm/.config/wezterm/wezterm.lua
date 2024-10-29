local wezterm = require("wezterm")

local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm")

local config = wezterm.config_builder()

local function theme_for_appearance(appearance)
	if appearance:find("Dark") then
		return theme.main
	else
		return theme.dawn
	end
end

local isLinux = string.find(wezterm.target_triple, "linux")

local theme_variant = theme_for_appearance(wezterm.gui.get_appearance())

config.term = "wezterm"
config.colors = theme_variant.colors()
config.window_frame = theme_variant.window_frame()
config.font = wezterm.font_with_fallback({ "JetbrainsMono NF", "JetbrainsMono Nerd Font" })
-- config.font = wezterm.font_with_fallback({ "MonaspiceNe NF", "MonaspiceNe Nerd Font" })
config.font_size = isLinux and 11.5 or 14
config.line_height = 1.3
-- config.front_end = "WebGpu"
config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0",
	-- top = isLinux and 0 or 56,
	bottom = "0.0cell",
}
config.enable_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1
if isLinux then
	-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	-- config.integrated_title_button_style = "Gnome"
else
	-- config.macos_window_background_blur = 90
	-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.window_decorations = "RESIZE"
	-- config.integrated_title_button_style = "MacOsNative"
end
config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config
